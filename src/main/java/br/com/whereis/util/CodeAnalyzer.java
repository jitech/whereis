package br.com.whereis.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.jacoco.core.analysis.Analyzer;
import org.jacoco.core.analysis.IClassCoverage;
import org.jacoco.core.analysis.ICoverageVisitor;
import org.jacoco.core.data.ExecutionDataStore;

public final class CodeAnalyzer implements ICoverageVisitor {

	private final Analyzer analyzer;
	private CodeAnalyzeReport report;

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
	}
	
	
	public CodeAnalyzeReport loadReport(final String location) throws IOException {
		this.analyzer.analyzeAll(new File(location));
		return report;
	}
}