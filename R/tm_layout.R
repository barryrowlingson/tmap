#' Layout of cartographic maps
#' 
#' This element specifies the map layout. The main function \code{tm_layout} controlls title, margins, aspect ratio, colors, frame, legend, among many other things. The function \code{tm_legend} is a shortcut to access all \code{legend.} arguments without this prefix. The other functions are wrappers for two purposes: the \code{tm_format_} functions specify position related layout settings such as margins, and the \code{tm_style_} functions specify general styling related layout settings such as colors and font. Typically, the former functions are shape dependent, and the latter functions are shape independent. See details for predefined styles and formats. With the global option \code{tmap.style}, a default style can be specified. Multiple \code{tm_layout} elements (or wrapper functions) can be stacked: called arguments will be overwritten.
#' 
#' Predefined styles:
#' \tabular{ll}{
#' \code{tm_style_white}\tab White background, commonly used colors (default) \cr
#' \code{tm_style_grey}/\code{_grey}\tab Grey background, useful to highlight sequential palettes (e.g. in choropleths) \cr
#' \code{tm_style_natural}\tab Emulation of natural view: blue waters and green land \cr
#' \code{tm_style_bw}\tab Greyscale, obviously useful for greyscale printing \cr
#' \code{tm_style_classic}\tab Classic styled maps (recommended) \cr
#' \code{tm_style_cobalt}\tab Inspired by latex beamer style cobalt \cr
#' \code{tm_style_albatross}\tab Inspired by latex beamer style cobalt \cr
#' \code{tm_style_beaver}\tab Inspired by latex beamer style beaver \cr
#' --------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
#' }
#'
#' Predefined formats
#' \tabular{ll}{
#' \code{tm_format_World}\tab Format specified for world maps \cr
#' \code{tm_format_World_wide}\tab Format specified for world maps with more space for the legend \cr
#' \code{tm_format_Europe}\tab Format specified for maps of Europe \cr
#' \code{tm_format_Europe_wide}\tab Format specified for maps of Europe with more space for the legend \cr
#' \code{tm_format_NLD}\tab Format specified for maps of the Netherlands \cr
#' \code{tm_format_NLD_wide}\tab Format specified for maps of the Netherlands with more space for the legend \cr
#' --------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
#' }
#' 
#' @name tm_layout
#' @rdname tm_layout
#' @param title Title(s). By default, the name of the statistical variable of which the legend is drawn at the top (see \code{legend.config}) is used as a title.
#' @param scale numeric value that serves as the global scale parameter. All font sizes, bubble sizes, border widths, and line widths are controled by this value. Each of these elements can be scaled independantly with the \code{scale}, \code{lwd}, or \code{size} arguments provided by the \code{\link{tmap-element}s}.
#' @param title.size Relative size of the title
#' @param bg.color Background color. By default it is \code{"white"}. A recommended alternative for choropleths is light grey (e.g., \code{"grey85"}).
#' @param aes.color Default color values for the aesthetics layers. Should be a named vector with the names chosen from: \code{fill}, \code{borders}, \code{bubbles}, \code{dots}, \code{lines}, \code{text}, \code{na}.
#' @param aes.palette Default color palettes for the aesthetics. It takes a list of three items: \code{seq} for sequential palettes, \code{div} for diverging palettes, and \code{cat} for categorical palettes. By default, Color Brewer palettes (see (see \code{RColorBrewer::display.brewer.all})) are used. It is also possible provide a vector of colors for any of these items.
#' @param attr.color Default color value for map attributes
#' @param sepia.intensity Number between 0 and 1 that defines the amount of sepia effect, which gives the map a brown/yellowish flavour. By default this effect is disabled (\code{sepia.intensity=0}). All colored used in the map are adjusted with this effect.
#' @param saturation Number that determines how much saturation (also known as chroma) is used: \code{saturation=0} is greyscale and \code{saturation=1} is normal. A number larger than 1 results in very saturated maps. All colored used in the map are adjusted with this effect. Hacking tip: use a negative number.
#' @param frame Either a boolean that determines whether a frame is drawn, or a color value that specifies the color of the frame. 
#' @param frame.lwd width of the frame
#' @param frame.double.line draw a double frame line border?
#' @param asp Aspect ratio. The aspect ratio of the map (width/height). If \code{NA}, it is determined by the bounding box (see argument \code{bbox} of \code{\link{tm_shape}}), the \code{outer.margins}, and the \code{inner.margins}. If \code{0}, then the aspect ratio is adjusted to the aspect ratio of the device.
#' @param outer.margins Relative margins between device and frame. Vector of four values specifying the bottom, left, top, and right margin. Values are between 0 and 1.
#' @param inner.margins Relative margins inside the frame. Vector of four values specifying the bottom, left, top, and right margin. Values are between 0 and 1. By default, 0 for each side if master shape is a raster, otherwise 0.02.
#' @param outer.bg.color Background color outside the frame.
#' @param fontface font face of all text in the map.
#' @param fontfamily font family of the text labels.
#' @param compass.type type of compass, one of: \code{"arrow"}, \code{"4star"}, \code{"8star"}, \code{"radar"}, \code{"rose"}. Of course, only applicable if a compass is shown. The compass type can also be set within \code{\link{tm_compass}}.
#' @param earth.boundary Logical that determines whether the boundaries of the earth are shown or an object that specifies the boundaries. This object can be a vector of size four, a 2 by 2 matrix (bounding box), or an \code{\link[raster:extent]{extent}} object. By default, the boundaries are \code{c(-180, 180, -90, 90)}. Useful for rojected world maps. Often, it is useful to crop both poles (e.g., with \code{c(-180, 180, -88, 88)}).
#' @param earth.boundary.color Color of the earth boundary.
#' @param earth.boundary.lwd Line width of the earth boundary.
#' @param earth.datum Geodetic datum to determine the earth boundary. By default \code{"WGS84"}, other frequently used datums are \code{"NAD83"} and \code{"NAD27"}. Any other \code{PROJ.4} character string can be used.
#' @param space.color Color of the space, i.e. the region inside the frame, and outsise the earth boundary.
#' @param legend.show Logical that determines whether the legend is shown.
#' @param legend.only logical. Only draw the legend (without map)? Particularly useful for small multiples with a common legend.
#' @param legend.position Position of the legend. Vector of two values, specifing the x and y coordinates. Either this vector contains "left", "LEFT", "center", "right", or "RIGHT" for the first value and "top", "TOP", "center", "bottom", or "BOTTOM" for the second value, or this vector contains two numeric values between 0 and 1 that specifies the x and y coordinates of the left bottom corner of the legend. The uppercase values correspond to the position without margins (so tighter to the frame). By default, it is automatically placed in the corner with most space based on the (first) shape object.
#' @param legend.width maximum width of the legend
#' @param legend.height maximum height of the legend.
#' @param legend.hist.height height of the histogram. This hight is initial. If the total legend is downscaled to \code{legend.height}, the histogram is downscaled as well.
#' @param legend.hist.width width of the histogram. By default, it is equal to the \code{legend.width}.
#' @param legend.title.size Relative font size for the legend title
#' @param legend.text.size Relative font size for the legend text elements
#' @param legend.hist.size Relative font size for the choropleth histogram
#' @param legend.format list of formatting options for the legend numbers. Only applicable if \code{labels} is undefined. Parameters are:
#' \describe{
#' \item{scientific}{Should the labels be formatted scientically? If so, square brackets are used, and the \code{format} of the numbers is \code{"g"}. Otherwise, \code{format="f"}, and \code{text.separator}, \code{text.less.than}, and \code{text.or.more} are used. Also, the numbers are automatically  rounded to millions or billions if applicable.}
#' \item{format}{By default, \code{"f"}, i.e. the standard notation \code{xxx.xxx}, is used. If \code{scientific=TRUE} then \code{"g"}, which means that numbers are formatted scientically, i.e. \code{n.dddE+nn} if needed to save space.}
#' \item{digits}{Number of digits after the decimal point if \code{format="f"}, and the number of significant digits otherwise.}
#' \item{text.separator}{Character string to use to separate numbers in the legend (default: "to").}
#' \item{text.less.than}{Character string to use to translate "Less than" (which is the default).}
#' \item{text.or.more}{Character string to use to translate "or more" (which is the default). }
#' \item{...}{Other arguments passed on to \code{\link[base:formatC]{formatC}}}
#' }
#' @param legend.text.color color of the legend text
#' @param legend.bg.color Background color of the legend. Use \code{TRUE} to match with the overall background color \code{bg.color}.
#' @param legend.bg.alpha Transparency number between 0 (totally transparent) and 1 (not transparent). By default, the alpha value of the \code{legend.bg.color} is used (normally 1).
#' @param legend.hist.bg.color Background color of the histogram
#' @param legend.hist.bg.alpha Transparency number between 0 (totally transparent) and 1 (not transparent). By default, the alpha value of the \code{legend.hist.bg.color} is used (normally 1).
#' @param title.snap.to.legend Logical that determines whether the title is part of the legend.
#' @param title.position Position of the title. Vector of two values, specifing the x and y coordinates. Either this vector contains "left", "LEFT", "center", "right", or "RIGHT" for the first value and "top", "TOP", "center", "bottom", or "BOTTOM" for the second value, or this vector contains two numeric values between 0 and 1 that specifies the x and y coordinates of the tile. The uppercase values correspond to the position without margins (so tighter to the frame). 
#' By default the title is placed on top of the legend (determined by \code{legend.position}).
#' @param title.color color of the title
#' @param legend.frame either a logical that determines whether the legend is placed inside a frame, or a color that directly specifies the frame border color. The width of the frame is automatically determined, but is upper-bounded by \code{legend.width}.
#' @param title.bg.color background color of the title. Use \code{TRUE} to match with the overall background color \code{bg.color}.
#' @param title.bg.alpha Transparency number between 0 (totally transparent) and 1 (not transparent). By default, the alpha value of the \code{title.bg.color} is used (normally 1).
#' @param attr.position Position of the map attributes, which are \code{\link{tm_credits}}, \code{\link{tm_scale_bar}} and \code{\link{tm_compass}}. Vector of two values, specifing the x and y coordinates. The first value is "left", "LEFT", "center", "right", or "RIGHT", and the second value "top", "TOP", "center", "bottom", or "BOTTOM". The uppercase values correspond to the position without margins (so tighter to the frame). Positions can also be set separately in the map attribute fuctions.
#' @param design.mode Logical that enables the design mode. If \code{TRUE}, inner and outer margins, legend position, aspect ratio are explicitely shown. Also, feedback text in the console is given.
#' @param ... other arguments from \code{tm_layout}
#' @seealso \href{../doc/tmap-nutshell.html}{\code{vignette("tmap-nutshell")}}
#' @example ../examples/tm_layout.R
#' @export
tm_layout <- function(title=NA,
					  scale=1,
					  title.size=1.3,
					  bg.color= "white",
					  aes.color=c(fill="grey85", borders="grey40", bubbles="blueviolet", dots="black", lines="red", text="black", na="grey70"),
					  aes.palette=list(seq="YlOrBr", div="RdYlGn", cat="Set3"),
					  attr.color="black",
  					  sepia.intensity=0, 
  					  saturation=1, 
					  frame=TRUE,
  					  frame.lwd=1,
  					  frame.double.line=FALSE,
					  asp = NA,
					  outer.margins = rep(0.02, 4),
					  inner.margins = NA,
					  outer.bg.color=NULL,
					  fontface="plain", 
					  fontfamily="sans",
 					  compass.type="arrow",
					  earth.boundary=FALSE,
					  earth.boundary.color=attr.color,
					  earth.boundary.lwd=1,
					  earth.datum="WGS84",
					  space.color=NULL,
					  legend.show = TRUE,
					  legend.only = FALSE,
					  legend.position = NULL,
					  legend.width = 0.3,
					  legend.height = 0.9,
					  legend.hist.height = 0.3,
					  legend.hist.width = legend.width,
					  legend.title.size=1.1,
					  legend.text.size=0.7,
					  legend.hist.size=0.7,
					  legend.format=list(scientific = FALSE, digits= NA, 
					  				   text.separator = "to", text.less.than = "Less than",
					  				   text.or.more = "or more"),
					  legend.frame = FALSE,
					  legend.text.color = attr.color,
					  legend.bg.color = NA,
					  legend.bg.alpha = 1,
					  legend.hist.bg.color = NA,
					  legend.hist.bg.alpha = 1,
					  title.snap.to.legend = FALSE,
					  title.position = c("left", "top"),
					  title.color=attr.color,
					  title.bg.color=NA,
					  title.bg.alpha = 1,
					  attr.position = c("right", "bottom"),
					  design.mode = FALSE) {
	g <- list(tm_layout=c(as.list(environment()), list(call=names(match.call(expand.dots = TRUE)[-1]))))
	class(g) <- "tm"
	g
}

#' @rdname tm_layout
#' @export
tm_legend <- function(...) {
	x <- list(...)

	tl_names <- names(formals("tm_layout"))
	is_leg <- which(substr(tl_names, 1, 3)=="leg")
	
	legend_x <- which(names(x) %in% substr(tl_names[is_leg], 8, nchar(tl_names[is_leg])))
	names(x)[legend_x] <- paste("legend", names(x)[legend_x], sep=".")

	do.call("tm_layout", x)
}

#' @rdname tm_layout
#' @export
tm_format_World <- function(title=NA,
							inner.margins=c(0, 0.05, 0.025, 0.01),
							legend.position=c("left", "bottom"), 
							attr.position=c("right", "bottom"),
							scale=.8,
							...) {
	args <- c(as.list(environment()), list(...))
	do.call("tm_layout", args)
}


#' @rdname tm_layout
#' @export
tm_format_World_wide <- function(title=NA,
								 inner.margins=c(0, 0.2, 0.025, 0.01),
							legend.position=c("left", "bottom"), 
							attr.position=c("right", "bottom"),
							legend.width=0.4,
							scale=.8,
							...) {
	args <- c(as.list(environment()), list(...))
	do.call("tm_layout", args)
}

#' @rdname tm_layout
#' @export
tm_format_Europe <- function(title=NA,
							 title.position=c("left", "top"),
							 legend.position=c("left", "top"), 
							 attr.position=c("left", "bottom"),
							 inner.margins=c(0, 0.1, 0, 0),
							 
							 ...) {
	args <- c(as.list(environment()), list(...))
	do.call("tm_layout", args)
}

#' @rdname tm_layout
#' @export
tm_format_Europe_wide <- function(title=NA,
								  title.position=c("left", "top"),
							 legend.position=c("left", "top"), 
							 attr.position=c("left", "bottom"),
							 inner.margins=c(0, 0.25, 0, 0),
							 legend.width=0.4,
							 legend.hist.width=0.4,
							 ...) {
	args <- c(as.list(environment()), list(...))
	do.call("tm_layout", args)
}



#' @rdname tm_layout
#' @export
tm_format_NLD <- function(title=NA,
						  frame=FALSE, 
						  inner.margins=c(.02, .2, .06, .02),
						  legend.position=c("left", "top"), 
						  legend.width=0.4,
						  attr.position=c("left", "bottom"),
						  ...) {
	args <- c(as.list(environment()), list(...))
	do.call("tm_layout", args)
}

#' @rdname tm_layout
#' @export
tm_format_NLD_wide <- function(title=NA,
						  frame=FALSE, 
						  inner.margins=c(.02, .3, .06, .02),
						  legend.position=c("left", "top"), 
						  legend.width=0.5,
						  legend.hist.width=0.35,
						  attr.position=c("left", "bottom"),
						  ...) {
	args <- c(as.list(environment()), list(...))
	do.call("tm_layout", args)
}

style_args <- c("bg.color", "aes.color", "aes.palette", "attr.color", "saturation", "sepia.intensity", "fontfamily", "frame.double.line", "compass.type", "space.color")

#' @rdname tm_layout
#' @export
tm_style_white <- function(...) {
	args <- list(...)
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}

#' @rdname tm_layout
#' @export
tm_style_gray <- function(bg.color="grey85", 
						   aes.color=c(fill="grey70", borders="grey20", bubbles="blueviolet", dots="black", lines="red", text="black", na="grey60"),
						   ...) {
	args <- c(as.list(environment()), list(...))
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}

#' @rdname tm_layout
#' @export
tm_style_natural <- function(bg.color="lightskyblue1",
							 aes.color=c(fill="darkolivegreen3", borders="black", bubbles="tomato2", dots="firebrick", lines="steelblue", text="black", na="white"),
							 aes.palette=list(seq="YlGn", div="RdYlGn", cat="Set3"),
							 attr.color="black", 
							 space.color="white",
							 earth.boundary=TRUE,
							 ...) {

	args <- c(as.list(environment()), list(...))
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}

#' @rdname tm_layout
#' @export
tm_style_grey <- tm_style_gray

#' @rdname tm_layout
#' @export
tm_style_cobalt <- function(bg.color="#002240",
							 aes.color=c(fill="#0088FF", borders="#002240", bubbles="#FF9D00", dots="#FF9D00", lines="#FFEE80", text="white", na="grey60"),
							 aes.palette=list(seq="YlGn", div="RdYlGn", cat="Set3"),
							 attr.color="white", ...) {
	# Bu="#0088FF" DaBu="#002240" LiBu="#BED6FF" Or="#FF9D00", W="white" Yl="FFEE80"
	# See https://www.hartwork.org/beamer-theme-matrix/
	
	args <- c(as.list(environment()), list(...))
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}

#' @rdname tm_layout
#' @export
tm_style_col_blind <- function(bg.color="white",
							aes.color=c(fill="grey85", borders="black", bubbles="#D55E00", dots="#0072B2", lines="#009E73", text="black", na="white"),
							aes.palette=list(seq="Blues", div="RdBu", cat=c("#D55E00", "#56B4E9", "#E69F00", "#009E73", "#F0E442", "#0072B2","#CC79A7")),
							attr.color="black", ...) {

	args <- c(as.list(environment()), list(...))
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}


#' @rdname tm_layout
#' @export
tm_style_albatross <- function(bg.color="#00007F",
								aes.color=c(fill="#4C4C88", borders="#00004C", bubbles="#BFBFFF", dots="#BFBFFF", lines="#BFBFFF", text="#FFE700", na="grey60"),
								aes.palette=list(seq="YlOrRd", div="RdYlGn", cat="Set3"),
								attr.color="#BFBFFF", ...) {
	# Y="#FFE700", Bu="#00007F", DaBu="#00004C", Gr="#BFBFFF", DaGr="#4C4C88"
	# See https://www.hartwork.org/beamer-theme-matrix/
	
	args <- c(as.list(environment()), list(...))
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}

#' @rdname tm_layout
#' @export
tm_style_beaver <- function(bg.color="#FFFFFF",
							 aes.color=c(fill="#FFE200", borders="#000000", bubbles="#A30000", dots="#A30000", lines="#A30000", text="#000000", na="#E0E0E0"),
							 aes.palette=list(seq="YlOrBr", div="RdYlGn", cat="Dark2"),
							 attr.color="black", ...) {
	# W="#FFFFFF" Y="#FFE200" Rd="#A30000" Bl="#000000" LiGr="#F0F0F0" Gr="E0E0E0"
	# See https://www.hartwork.org/beamer-theme-matrix/
	
	args <- c(as.list(environment()), list(...))
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}

#' @rdname tm_layout
#' @export
tm_style_bw <- function(saturation=0, ...) {
	args <- c(as.list(environment()), list(...))
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}

#' @rdname tm_layout
#' @export
tm_style_classic <- function(sepia.intensity=.7, fontfamily="serif", frame.double.line=TRUE, compass.type="rose", ...) {
	args <- c(as.list(environment()), list(...))
	g <- do.call("tm_layout", args)
	g$tm_layout$call <- union(g$tm_layout$call, style_args)
	g
}
