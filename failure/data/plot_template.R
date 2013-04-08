#! /usr/bin/env R
filename    = '__INPUT_FILE__'
pdfFile     = '__PDF_FILE__'
pdfWidth    = __PDF_WIDTH__
pdfHeight   = __PDF_HEIGHT__

pdf(pdfFile, width=pdfWidth, height=pdfHeight)
data = read.table(filename, header=T)
data[ , 1:3 ] = data [ , 1:3 ] / 1000 # msec -> sec

# plot parameters
ylimit  = c(__YLIM_MIN__, __YLIM_MAX__)
xlimit  = c(__XLIM_MIN__, __XLIM_MAX__)
lTypes  = c(__LTYPES__)                 # line types
lWidth  = __LWIDTH__                    # line width
pScale  = __PSCALE__                    # point size
fScale  = __FSCALE__                    # font size
xlabel  = 'Time (s)'
ylabel  = 'Operation Latency (s)'

par( bty = 'n' )
par( mgp = c(2.5, 1, 0) ) # axis & label shifting

plot(   data$timestamp, data$meanRdLat,
        ylim=ylimit, xlim=xlimit,
        type='l', lty=lTypes[1],
        ylab=ylabel, xlab=xlabel,
        cex=pScale, lwd=lWidth,
        cex.axis=fScale, cex.lab=fScale, cex.main=fScale )

par( new = T )
        
plot(   data$timestamp, data$meanWrLat,
        ylim=ylimit, xlim=xlimit,
        type='l', lty=lTypes[2],
        ylab='', xlab='', axes=F,
        cex=pScale, lwd=lWidth,
        cex.axis=fScale, cex.lab=fScale, cex.main=fScale )

# TODO
#legend(     'top',

dev.off()
