{smcl}
{* 07 December 2008, revised Feb 2021 to add weight types}{...}
{hline}
help for {hi:ineqrbd}{right:Carlo V. Fiorio and Stephen P. Jenkins (revised February 2021)}
{hline}

{title:Regression-based inequality decomposition, following Fields (2003)}

{p 8 17 2} {cmd:ineqrbd} {it:depvar} {it:rhsvars} [{it:weights}] 
         [ {cmd:if} {it:exp}] [{cmd:in} {it:range} ]
         [,  {cmd:i2} {cmdab:s:tats} {cmdab:nocons:tant} {cmdab:noreg:ression} {cmdab:f:ields}  ]
                
{p 4 4 2} {cmd:fweight}s, {cmd:aweights}, {cmd:pweights}, and {cmd:iweights} 
are allowed; see {help weights}.

{title:Description}

{p 4 4 2} 
{cmd:ineqbrd} performs regression-based decomposition of the inequality in
{it:depvar} into the contributions accounted for by each of the {it:rhsvars}.
The formulae used are those proposed by Fields (2003) which, in turn, are
closely related to those proposed by Shorrocks (1982) for non-regression-based
decomposition of inequality by income source. 

{p 4 4 2} 
Consider the linear model for each observation

{p 8 4 2} 
(1) {it: yvar} = b0 + b1*X1 + b2*X2 + ... + bK*XK + residual

{p 4 4 2}
where the Xf, for f = 1,...,K are the variables included in {it:rhsvars}, and
the bf are the corresponding regression coefficients that are estimated by OLS.

{p 4 4 2}
The linear model can be rewritten as 

{p 8 4 2} 
(2) {it: yvar} = b0 + Z1 + Z2 + ... + ZK + residual

{p 4 4 2}
where each Zf, for each f = 1,...,K is a `composite' variable, equal to the product of an 
estimated regression coefficient and a variable. For inequality decomposition calculations, 
the value of b0 is irrelevant as it is constant for every observation.

{p 4 4 2} 
Alternatively, one may look at {it:predicted yvar} (`yhat')

{p 8 4 2} 
(3) {it: yhat} = b0 + Z1 + Z2 + ... + ZK

{p 4 4 2} 
in which case there is no residual term.

{p 4 4 2}
Neglecting the constant, equations (2) and (3) are of exactly the same form as the equation
used by Shorrocks (1982) when deriving rules for inequality decomposition by factor components.
(E.g. total income is the sum of labour earnings, income from savings and other assets, private
and public transfers. How much inequality in total income is attributable to each of these factors?)
Shorrocks proved that a set of arguably persuasive axioms led to a unique additive and exact
decomposition rule, with one term for each factor. The decomposition rule did {it:not} depend
on the choice of measure summarizing inequality in total income.

{p 4 4 2}
Fields (2003) exploited the parallel with the factor decomposition case, and applied the
Shorrocks decomposition rule to relate inequality in {it:predicted yvar} to contributions from 
each of the composite variables. Alternatively, one may apply the decomposition rule
to the inequality of {it:yvar} itself, in which case there is also a decomposition term 
corresponding to the residual. 
See {browse "http://sticerd.lse.ac.uk/dps/darp/DARP82.pdf":Cowell and Fiorio, 2006}.

{p 4 4 2}{cmd:ineqrbd} provides a regression-based Shorrocks-type decomposition of a variable labelled "Total",
where Total is defined as {it:yvar}, unless the {cmd:fields} option is used in which case Total refers
to {it:predicted yvar}. In either case, the contribution to inequality in Total of each 
term is labelled "s_f" in the output.

{title:Options}

{p 4 8 2}{cmd:fields} implies decomposition of {it:predicted yvar} rather than of {it:yvar}.

{p 4 8 2} 
{cmd:noregression} suppresses reporting of the OLS regression equation used to derive the
composite variables and residual.

{p 4 8 2} 
{cmd:noconstant} excludes the intercept term from the regression.

{p 4 8 2} 
{cmd:stats} provides the means, standard deviations, and correlations, of 
Total, the residual (unless the {cmd:fields} option is used), and the 
composite variables Zf, f = 1,...,K. Results for the composite variables 
are ordered in the same order as the underlying variables are ordered in {it:rhsvars}.

{p 4 8 2} 
{cmd:i2} summarises inequality using half the squared coefficient of variation
(the Generalized Entropy measure I2), rather than the coefficient of variation (CV).
Observe that that inequality may be negative, e.g. because the mean of a composite variable
may be negative.


{title:Saved results} 

    r(total) 				contains {it:predicted yvar} if {cmd:fields} option
					used; else contains {it: yvar} 

    r(mean_tot), r(sd_tot), r(cv_tot)  	mean, standard deviation, CV for Total

    r(sf_Z0), r(mean_Z0),   		proportionate inequality contribution, mean, 
    r(sd_Z0), r(cv_Z0)			standard deviation, CV for the residual.
					r(sf_Z0) is not reported if {cmd:fields} option used.

    r(sf_Zf), r(mean_Zf),   		proportionate inequality contribution, mean, 
    r(sd_Zf), r(cv_Zf)			standard deviation, CV for each of variables
					in {it:rhsvars}, where "f" is an integer
					1,..., K, indicating the order in which entered in 
					{it:rhsvars}.
    r(varlist)				contains {it:yvar} {it:rhsvars} 
    r(yvar)				contains {it:yvar} 	
    r(xvars)				contains {it:rhsvars} 	
	


{title:Example}

{p 4 8 2}{cmd:. sysuse auto}

{p 4 8 2}{cmd:. ineqrbd price trunk weight length foreign}


{title:Authors}

{p 4 4 2}Carlo Fiorio <carlo.fiorio@unimi.it>{break}
University of Milan

{p 4 4 2}Stephen P. Jenkins <s.jenkins@lse.ac.uk>{break}
London School of Economics


{title:Acknowledgement} 

{p 4 8 2}{cmd:ineqrbd} uses code from {cmd:ineqfac} by S.P. Jenkins. 
Thanks to Andreas Peichl and Nico Pestel who discovered bugs in earlier versions 
and provided code for squashing them.

{title:References} 

{p 4 8 2}
Cowell, F.A. and Fiorio, C.V. 2006. Rethinking Inequality Decomposition: Comment. 
Distributional Analysis Research Programme Working Paper 82. 
London: STICERD, London School of Economics.
{browse "http://sticerd.lse.ac.uk/dps/darp/DARP82.pdf"}

{p 4 8 2}
Fields, G. 2003. Accounting for Income Inequality and Its Change: 
    A New Method, with Application to the Distribution of Earnings 
    in the United States', {it:Research in Labor Economics}.

{p 4 8 2}
Shorrocks, A.F. 1982. Inequality Decomposition by Factor Components. 
    {it:Econometrica} 50: 193{c -}212.


{title:Also see}

{p 4 13 2}
{help ineqfac} if installed

