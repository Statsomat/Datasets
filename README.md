# CFA-Testing

This repository contains the work for the testing of the app Statsomat/CFA. The results are saved in the file `Tests_CFA.xlsx`.

Preliminary information

Link for the app: https://statsomat.shinyapps.io/confirmatory-factor-analysis/.

The app is tested by means of relevant data cases from literature. A testing case is made of: 

•	a CSV file  
•	a model in lavaan syntax (saved as a TXT file)  
•	references for the dataset and for the interpretation   

Please mention the number of variables and the factors in the name of the case folder.

Issues

1.	Understanding: Inspect the CFA app by using the available testing cases (datasets, model syntax and interpretation). Understand the functionality of the app. Understand the output tables of the app. Understand the statistical interpretation delivered by the app. Compare it to the available sources (book or URL). 

2.	Create testing cases for CFA from the book:
http://sites.bu.edu/tabrown/cfabook/ 

(You have the book also as a kindle e-book) 

3.	Create testing cases for CFA from the book:
https://www.guilford.com/companion-site/Principles-and-Practice-of-Structural-Equation-Modeling-Fourth-Edition/9781462523344/files

4.	Create other testing cases 

•	http://md.psych.bio.uni-goettingen.de/mv/unit/cfa/cfa.html#beispiel-emotionale-intelligenz-als-cfa-mit-librarylavaan

•	Several CFA calls, try all of them: 
https://stats.idre.ucla.edu/spss/seminars/introduction-to-factor-analysis/a-practical-introduction-to-factor-analysis-confirmatory-factor-analysis/ 

•	https://bookdown.org/MathiasHarrer/Doing_Meta_Analysis_in_R/confirmatory-factor-analysis.html

•	Complex, several CFA calls, try all of them: http://faculty.missouri.edu/huangf/data/mcfa/MCFA%20in%20R%20HUANG.pdf


5.	Simulate datasets for testing cases (given covariance or correlation matrices plus mean vectors). Simulate the number of observations shown in the book. Try this link:  https://www.r-bloggers.com/simulating-random-multivariate-correlated-data-continuous-variables/	

6.	Report the tests in the file Tests_CFA.xlsx. Compare the output of the app with the output from the book and make your comments. Mark with blue/green/yellow/red. Each case should have its own Github issue for discussions – please create the issues if not available. 

