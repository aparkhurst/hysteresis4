plot.ellipsesummary<-function(x,putNumber=FALSE,values=NULL,xlim=NULL,ylim=NULL,main=NULL,newPred=TRUE,show=NULL,...){
a <- x
  if (newPred==TRUE)
  {
ti <- (1:101)*pi/50
Input <- a$values["b.x","Boot.Estimate"]*cos(ti)+a$values["cx","Boot.Estimate"]
Output <- a$values["b.y","Boot.Estimate"]*cos(ti)+a$values["retention","Boot.Estimate"]*sin(ti)+a$values["cy","Boot.Estimate"]
}
else {
Output <- a$pred.y
Output[length(Output)+1] <- Output[1]
Input <- a$pred.x
Input[length(Input)+1] <- Input[1] }
if (is.null(xlim)) xlim <-c(min(c(a$x,Input)),max(c(a$x,Input)))
if (is.null(ylim)) ylim <- c(min(c(a$y,Output)),max(c(a$y,Output)))  
if (is.null(values)) plot(Output~Input,type="l",ylim=ylim,xlim=xlim,main=main,...)
  else {
  if (values=="inherent") {
    plot(Output~Input,type="l",ylim=ylim,xlim=xlim,...)
    title(line=3, paste(main),cex=1.2)
    mtext(paste(
      "b.x=",format(a$values["b.x","Boot.Estimate"],digits=3)," b.y=",format(a$values["b.y","Boot.Estimate"],digits=3)),side=3,line=1.85,cex=0.75)
    mtext(paste("cx=",format(a$values["cx","Boot.Estimate"],digits=3)," cy=",format(a$values["cy","Boot.Estimate"],digits=3)),side=3,line=0.95,cex=0.75)
    mtext(paste("Retention=",format(a$values["retention","Boot.Estimate"],digits=3)),side=3,line=0.0,cex=0.75)
  }
  
  if (values=="hysteresis") {
    plot(Output~Input,type="l",ylim=ylim,xlim=xlim,...)
    title(line=3, paste(main),cex=1.2)
    mtext(paste(
      "b.x=",format(a$values["b.x","Boot.Estimate"],digits=3)," b.y=",format(a$values["b.y","Boot.Estimate"],digits=3)," cx=",format(a$values["cx","Boot.Estimate"],digits=3)),side=3,line=1.85,cex=0.75)
    mtext(paste("cy=",format(a$values["cy","Boot.Estimate"],digits=3)," Area=",format(a$values["area","Boot.Estimate"],digits=3)," Lag=",format(a$values["lag","Boot.Estimate"],digits=3)),side=3,line=0.95,cex=0.75)
    mtext(paste("Retention=",format(a$values["retention","Boot.Estimate"],digits=3)," Coercion=",format(a$values["coercion","Boot.Estimate"],digits=3)),side=3,line=0.0,cex=0.75)
  }
  
  if (values=="hysteresis.all") {
    plot(Output~Input,type="l",ylim=ylim,xlim=xlim,...)
    title(line=3, paste(main),cex=1.2)
    mtext(paste(
      "b.x=",format(a$values["b.x","Boot.Estimate"],digits=3)," b.y=",format(a$values["b.y","Boot.Estimate"],digits=3)," cx=",format(a$values["cx","Boot.Estimate"],digits=3)," cy=",format(a$values["cy","Boot.Estimate"],digits=3)),side=3,line=1.85,cex=0.75)
    mtext(paste("Area=",format(a$values["area","Boot.Estimate"],digits=3)," Lag=",format(a$values["lag","Boot.Estimate"],digits=3)," Retention=",format(a$values["retention","Boot.Estimate"],digits=3)," Split Angle=",format(a$values["split.angle","Boot.Estimate"],digits=3)),side=3,line=0.95,cex=0.75)
    mtext(paste("Coercion=",format(a$values["coercion","Boot.Estimate"],digits=3)," Hysteresis x=",format(a$values["hysteresis.x","Boot.Estimate"],digits=3)," Hysteresis y=",format(a$values["hysteresis.y","Boot.Estimate"],digits=3)),side=3,line=0.0,cex=0.75)
  }
  
  if (values=="derived") {
    plot(Output~Input,type="l",ylim=ylim,xlim=xlim,...)
    title(line=3, paste(main),cex=1.2)
    mtext(paste(
      "Coercion=",format(a$values["coercion","Boot.Estimate"],digits=3)," Area=",format(a$values["area","Boot.Estimate"],digits=3)),side=3,line=1.85,cex=0.75)
    mtext(paste("Lag=",format(a$values["lag","Boot.Estimate"],digits=3)," Split Angle=",format(a$values["split.angle","Boot.Estimate"],digits=3)),side=3,line=0.95,cex=0.75)
    mtext(paste("Hysteresis x=",format(a$values["hysteresis.x","Boot.Estimate"],digits=3)," Hysteresis y=",format(a$values["hysteresis.y","Boot.Estimate"],digits=3)),side=3,line=0.0,cex=0.75)
  }
  
  if (values=="ellipse") {
    plot(Output~Input,type="l",ylim=ylim,xlim=xlim,...)
    title(line=3, paste(main),cex=1.2)
    mtext(paste(
      "Ampx=",format(a$values["ampx","Boot.Estimate"],digits=3)," Ampy=",format(a$values["ampy","Boot.Estimate"],digits=3)),side=3,line=1.85,cex=0.75)
    mtext(paste("rote.deg=",format(a$values["rote.deg","Boot.Estimate"],digits=3)," Eccentricity=",format(a$values["eccentricity","Boot.Estimate"],digits=3)),side=3,line=0.95,cex=0.75)
    mtext(paste("S-major Axis=",format(a$values["semi.major","Boot.Estimate"],digits=3)," S-minor Axis=",format(a$values["semi.minor","Boot.Estimate"],digits=3)),side=3,line=0.0,cex=0.75)
  }
  if (values=="ellipse.all") {
    plot(Output~Input,type="l",ylim=ylim,xlim=xlim,...)
    title(line=3, paste(main),cex=1.2)
    mtext(paste("Cx=",format(a$values["cx","Boot.Estimate"],digits=3)," Cy=",format(a$values["cy","Boot.Estimate"],digits=3),
                " Ampx=",format(a$values["ampx","Boot.Estimate"],digits=3)," Ampy=",format(a$values["ampy","Boot.Estimate"],digits=3)),side=3,line=1.85,cex=0.75)
    mtext(paste("rote.deg=",format(a$values["rote.deg","Boot.Estimate"],digits=3)," focus.x=",format(a$values["focus.x","Boot.Estimate"],digits=3)," focus.y=",format(a$values["focus.y","Boot.Estimate"],digits=3)),side=3,line=0.95,cex=0.75)
    mtext(paste("S-major Axis=",format(a$values["semi.major","Boot.Estimate"],digits=3)," S-minor Axis=",format(a$values["semi.minor","Boot.Estimate"],digits=3)," Eccentricity=",format(a$values["eccentricity","Boot.Estimate"],digits=3)),side=3,line=0.0,cex=0.75)
  }
  }
points(a$y~a$x,pch=1,cex=0.85)

if (any(show=="semi.major")) segments(a$values["cx","Boot.Estimate"],a$values["cy","Boot.Estimate"],a$values["cx","Boot.Estimate"]+a$values["semi.major","Boot.Estimate"]*cos(a$values["rote.deg","Boot.Estimate"]/180*pi),a$values["cy","Boot.Estimate"]+a$values["semi.major","Boot.Estimate"]*sin(a$values["rote.deg","Boot.Estimate"]/180*pi),col="red")
if (any(show=="semi.minor")) segments(a$values["cx","Boot.Estimate"],a$values["cy","Boot.Estimate"],a$values["cx","Boot.Estimate"]+a$values["semi.minor","Boot.Estimate"]*cos(a$values["rote.deg","Boot.Estimate"]/180*pi+pi/2),a$values["cy","Boot.Estimate"]+a$values["semi.minor","Boot.Estimate"]*sin(a$values["rote.deg","Boot.Estimate"]/180*pi+pi/2),col="red")

if (any(show %in% c("b.x","b.y"))) segments(a$values["cx","Boot.Estimate"],a$values["cy","Boot.Estimate"],a$values["cx","Boot.Estimate"]+a$values["b.x","Boot.Estimate"],a$values["cy","Boot.Estimate"]+a$values["b.y","Boot.Estimate"],col="blue")
  if (any(show %in% c("focus.x","focus.y"))) points(c(a$values["cx","Boot.Estimate"]+a$values["focus.x","Boot.Estimate"],a$values["cx","Boot.Estimate"]-a$values["focus.x","Boot.Estimate"]),c(a$values["cy","Boot.Estimate"]+a$values["focus.y","Boot.Estimate"],a$values["cy","Boot.Estimate"]-a$values["focus.y","Boot.Estimate"]),col="gold",cex=2,pch=19)
  if (any(show=="rote.deg")) { arrows(a$values["cx","Boot.Estimate"]+a$values["coercion","Boot.Estimate"],a$values["cy","Boot.Estimate"],a$values["cx","Boot.Estimate"]+a$values["focus.x","Boot.Estimate"],a$values["cy","Boot.Estimate"]+a$values["focus.y","Boot.Estimate"])
                               segments(a$values["cx","Boot.Estimate"],a$values["cy","Boot.Estimate"],a$values["cx","Boot.Estimate"]+a$values["coercion","Boot.Estimate"],a$values["cy","Boot.Estimate"],lty=2)
  }
if (any(show=="retention")) segments(a$values["cx","Boot.Estimate"],a$values["cy","Boot.Estimate"],a$values["cx","Boot.Estimate"],a$values["cy","Boot.Estimate"]+a$values["retention","Boot.Estimate"],col="purple")

if (any(show=="coercion")) segments(a$values["cx","Boot.Estimate"],a$values["cy","Boot.Estimate"],a$values["cx","Boot.Estimate"]+a$values["coercion","Boot.Estimate"],a$values["cy","Boot.Estimate"],col="green")
  
if (putNumber==TRUE){
  text(a$x,a$y,as.character(format(1:length(a$y),digits=4)))
}

}
