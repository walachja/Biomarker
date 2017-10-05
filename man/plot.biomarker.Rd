\name{plot.biomarker}
\alias{plot.biomarker}

\title{Plot function for \code{"biomarker"} objects
}

\description{Plotting object of class  \code{"biomarker"}, which is result of function  \code{biomarker}}
\usage{
plot.biomarker(x, type="Vstar",...)
}
\arguments{
  \item{x}{object of the type \code{biomarker}}
  \item{type}{possible type of the plot: \code{"Vstar"} and  \code{"diag"}. In first case the normalized values of \emph{V} statistic (\emph{V*}), otherwise cell outlier diagnostics is plotted.}

  \item{\dots}{
another arguments, curently not being used.
}
}
\details{
If \code{type="Vstar"}, all the values above the treashold (dotted line) were identified as biomarkers.
If \code{type="diag"}, a graphical representation of outlyingness of each cell is plotted. Continuous gray scale is used, where black represents "biggest" outliers. Stars on the top of plot indicates the positions of the biomarkers.}


\author{
Jan Walach
}

\seealso{
\link{biomarker},
%\link{print.biomarker},\link{summary.biomarker}
}
\examples{
# Data simulation
set.seed(4523)
n <- 40; p <- 50
r <- runif(p, min = 1, max = 10)
conc <- runif(p, min = 0, max = 1)*5+matrix(1,p,1)*5
a <- conc*r
S <- rnorm(n,0,0.3)\%*\%t(rep(1,p))
B <- matrix(rnorm(n*p,0,0.8),n,p)
R <- rep(1,n)\%*\%t(r)
M <- matrix(rnorm(n*p,0,0.021),n,p)
# Fifth observation is outlier
M[5,] <- M[5,]*3 + sample(c(0.5,-0.5),replace=TRUE,p)
C <- rep(1,n)\%*\%t(conc)
C[1:20,c(2,15,28,40)] <- C[1:20,c(2,15,28,40)]+matrix(1,20,4)*1.8
X <- (1-S)*(C*R+B)*exp(M)

# Biomarker identification
b <- biomarker(X,g1=1:20,g2=21:40,type ="tau")

plot(b,type="diag")
plot(b,type="Vstar")
}

