package br.com.whereis.util;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;

import org.jacoco.core.analysis.Analyzer;
import org.jacoco.core.analysis.IClassCoverage;
import org.jacoco.core.analysis.ICoverageVisitor;
import org.jacoco.core.data.ExecutionDataStore;

public final class CodeAnalyzer implements ICoverageVisitor {

	private final Analyzer analyzer;
	private CodeAnalyzeReport report;
	private IClassCoverage iClassCoverage;

	public CodeAnalyzer() {
		this.analyzer = new Analyzer(new ExecutionDataStore(), this);
		this.report = new CodeAnalyzeReport();
		this.report.setAnalyzes(new ArrayList<CodeAnalyze>());
	}

	/*
	 * 	De acordo com o trabalho de McCabe, os valores de referência são:

		Complexidade	Avaliação
				1-10	Método simples. Baixo risco.
				11-20	Método razoavelmente complexo. Moderado risco.
				21-50	Método muito complexo. Elevado risco.
				51-N	Método de ==altíssimo risco== e bastante instável.
	 * */
	public void visitCoverage(final IClassCoverage iClassCoverage) {	
		this.report.getAnalyzes().add(new CodeAnalyze(iClassCoverage.getName(), iClassCoverage.getComplexityCounter().getTotalCount()));
		this.iClassCoverage = iClassCoverage;
	}
	
	
	public CodeAnalyzeReport loadReport(final String location) throws IOException {
		this.analyzer.analyzeAll(new File(location));
		return report;
	}
	
	public boolean isCorrectMethod(String pathFile, String methodName, Object param, Object expected) {
		
		try {
				@SuppressWarnings("rawtypes")
				Class params[] = new Class[1];
				params[0] = Integer.class;
			
				URL url = new URL("file:"+pathFile);
				URL[] urls = {url};
		
				URLClassLoader child = new URLClassLoader(urls);
			
				@SuppressWarnings("rawtypes")
				Class cls = Class.forName(iClassCoverage.getName().replaceAll("/", "."),true, child);
		
				Object obj = cls.newInstance();
			
				@SuppressWarnings("unchecked")
				Method method = cls.getDeclaredMethod(methodName, params);
					
				if(method.invoke(obj, param) == expected) {				
					return true;
				}
			
				return false;
			
		}catch(Exception ex) {		
			ex.printStackTrace();
			return false;
		}
	}
}