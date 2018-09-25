package br.com.whereis.util;

import java.util.List;

public class CodeAnalyzeReport {

	private List<CodeAnalyze> analyzes;

	public CodeAnalyzeReport() {
		super();
	}

	public CodeAnalyzeReport(List<CodeAnalyze> analyzes) {
		super();
		this.analyzes = analyzes;
	}

	public List<CodeAnalyze> getAnalyzes() {
		return analyzes;
	}

	public void setAnalyzes(List<CodeAnalyze> analyzes) {
		this.analyzes = analyzes;
	}
}