#' Map coloring
#'
#' Color the polygons of a map such that adjacent polygons have different colors
#' 
#' @param x Either a \code{\link[sp:SpatialPolygonsDataFrame]{SpatialPolygons(DataFrame)}} or an adjacency list.
#' @param algorithm currently, only "greedy" is implemented.
#' @param ncols number of colors. By default it is 8 when \code{palette} is undefined. Else, it is set to the length of \code{palette}
#' @param minimize logical that determines whether \code{algorithm} will search for a minimal number of colors. If \code{FALSE}, the \code{ncols} colors will be picked by a random procedure.
#' @param palette color palette.
#' @param contrast vector of two numbers that determine the range that is used for sequential and diverging palettes (applicable when \code{auto.palette.mapping=TRUE}). Both numbers should be between 0 and 1. The first number determines where the palette begins, and the second number where it ends. For sequential palettes, 0 means the brightest color, and 1 the darkest color. For diverging palettes, 0 means the middle color, and 1 both extremes. If only one number is provided, this number is interpreted as the endpoint (with 0 taken as the start).
#' @return If \code{palette} is defined, a vector of colors is returned, otherwise a vector of color indices.
#' @importFrom spdep poly2nb
#' @example ../examples/map_coloring.r
#' @examples 
#' \dontrun{
#' qtm(World, fill="MAP_COLORS", fill.palette="Pastel2")
#' tm_shape(World) +
#'   tm_polygons("MAP_COLORS", palette="Pastel2")
#' }
#' @export
map_coloring <- function(x, algorithm="greedy", ncols=NA, minimize=FALSE, palette=NULL, contrast=1) {
	if (inherits(x, "SpatialPolygons")) {
		# get adjacency list
		adj <- poly2nb(x)
	} else if (is.list(x)) {
		adj <- x
	} else stop("Unknown x argument")
	
	if (!is.null(palette)) {
		# reverse palette
		if (length(palette)==1 && substr(palette[1], 1, 1)=="-") {
			revPal <- function(p)rev(p)
			palette <- substr(palette, 2, nchar(palette))
		} else revPal <- function(p)p
		
		palette2 <- if (palette[1] %in% rownames(brewer.pal.info)) {
			maxp <- brewer.pal.info[palette, "maxcolors"]
			if (is.na(ncols)) ncols <- maxp
			brewerpal <- brewer.pal(maxp, name=palette)
			if (brewer.pal.info[palette, "category"]=="qual") {
				p <- rep(brewerpal, length.out=ncols)
			} else {
				if (length(contrast)==1) contrast <- c(0, contrast)
				crange <- contrast[2] - contrast[1]
				ext <- ncols/crange
				from <- floor(contrast[1] * ext)
				to <- from + ncols
				p <- colorRampPalette(brewerpal)(ext)[from:to]
			}
			revPal(p)
		} else {
			if (is.na(ncols)) ncols <- length(palette)
			rep(palette, length.out=ncols)
		}
	} else if (is.na(ncols)) ncols <- 8
	
	k <- length(adj)
	
	if (algorithm=="greedy") {
		# list of occupied colors
		occ <- as.list(rep(0, k))
		
		# vector of output colors
		cols <- rep(NA, k)
		
		# order of degree (starting with the highest)
		ord <- order(sapply(adj, length), decreasing = TRUE)
		
		showWarn <- FALSE
		for (i in ord) {
			sel <- setdiff(1:ncols, occ[[i]])
			
			if (!length(sel)) {
				sel <- 1
				showWarn <- TRUE
			}
			z <- if (minimize) sel[1] else sample(sel, 1)
			
			for (j in ord) if (i %in% adj[[j]]) occ[[j]] <- c(occ[[j]], z)
			cols[i] <- z
		}
	} else stop("Unknown algorithm")
	
	if (showWarn) warning(paste("Unable to color with", ncols, "colors. Adjacent polygons may have the same color."))
	
	if (!is.null(palette)) {
		palette2[cols]
	} else {
		cols
	}
}
