% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/smooth_map.R
\name{smooth_map}
\alias{smooth_map}
\title{Create a smooth map in various formats: smooth raster, contour lines, and dasymetric polygons.}
\usage{
smooth_map(shp, var = NULL, nrow = NA, ncol = NA, N = 250000,
  unit = "km", unit.size = 1000, smooth.raster = TRUE, nlevels = 5,
  style = ifelse(is.null(breaks), "pretty", "fixed"), breaks = NULL,
  bandwidth = NA, cover.type = NA, cover = NULL, cover.threshold = 0.6,
  weight = 1, extracting.method = "full", buffer.width = NA,
  to.Raster = FALSE)
}
\arguments{
\item{shp}{shape object of class \code{\link[sp:Spatial]{Spatial}} or \code{\link[raster:Raster-class]{Raster}}. Spatial points, polygons, and grids are supported. Spatial lines are not.}

\item{var}{variable name. Not needed for \code{\link[sp:SpatialPoints]{SpatialPoints}}. If missing, the first variable name is taken.}

\item{nrow}{number of rows in the raster that is used to smooth the shape object. Only applicable if shp is not a \code{\link[sp:SpatialGridDataFrame]{SpatialGrid(DataFrame)}} or \code{\link[raster:Raster-class]{Raster}}}

\item{ncol}{number of rows in the raster that is used to smooth the shape object. Only applicable if shp is not a \code{\link[sp:SpatialGridDataFrame]{SpatialGrid(DataFrame)}} or \code{\link[raster:Raster-class]{Raster}}}

\item{N}{preferred number of points in the raster that is used to smooth the shape object. Only applicable if shp is not a \code{\link[sp:SpatialGridDataFrame]{SpatialGrid(DataFrame)}} or \code{\link[raster:Raster-class]{Raster}}}

\item{unit}{unit specification. Needed when calculating density values. When set to \code{NA}, the densities values are based on the dimensions of the raster (defined by \code{nrow} and \code{ncol}). See also \code{unit.size}.}

\item{unit.size}{size of the unit in terms of coordinate units. The coordinate system of many projections is approximately in meters while thematic maps typically range many kilometers, so by default \code{unit="km"} and \code{unit.size=1000} (meaning 1 kilometer equals 1000 coordinate units).}

\item{smooth.raster}{logical that determines whether 2D kernel density smoothing is applied to the raster shape object. Not applicable when \code{shp} is a \code{\link[sp:SpatialPoints]{SpatialPoints}} object.}

\item{nlevels}{preferred number of levels}

\item{style}{method to cut the color scale: e.g. "fixed", "equal", "pretty", "quantile", or "kmeans". See the details in \code{\link[classInt:classIntervals]{classIntervals}}.}

\item{breaks}{in case \code{style=="fixed"}, breaks should be specified}

\item{bandwidth}{single numeric value or vector of two numeric values that specifiy the bandwidth of the kernal density estimator. By default, it is 1/50th of the shortest side in units (specified with \code{unit.size}).}

\item{cover.type}{character value that specifies the type of raster cover, in other words, how the boundaries are specified. Options: \code{"original"} uses the same boundaries as \code{shp} (default for polygons), \code{"smooth"} calculates a smooth boundary based on the 2D kernal density (determined by \code{\link{smooth_raster_cover}}), \code{"rect"} uses the bounding box of \code{shp} as boundaries (default for spatial points and grids).}

\item{cover}{\code{\link[sp:SpatialPolygons]{SpatialPolygons}} shape that determines the covered area in which the contour lines are placed. If specified, \code{cover.type} is ignored.}

\item{cover.threshold}{numeric value between 0 and 1 that determines which part of the estimated 2D kernal density is returned as cover. Only applicable when \code{cover.type="smooth"}.}

\item{weight}{single number that specifies the weight of a single point. Only applicable if \code{shp} is a \code{\link[sp:SpatialPoints]{SpatialPoints}} object.}

\item{extracting.method}{Method of how coordinates are extracted from the dasymetric polygons. Options are: \code{"full"} (default), \code{"grid"}, and \code{"single"}. See details. For the slowest method \code{"full"}, \code{\link[raster:extract]{extract}} is used. For \code{"grid"}, points on a grid layout are selected that intersect with the polygon. For \code{"simple"}, a simple point is generated with \code{\link[rgeos:gPointOnSurface]{gPointOnSurface}}.}

\item{buffer.width}{Buffer width of the iso lines to cut dasymetric polygons. Should be small enough to let the polygons touch each other without space in between. However, too low values may cause geometric errors.}

\item{to.Raster}{should the "raster" output (see \code{output}) be a \code{\link[raster:Raster-class]{RasterLayer}}? By default, it is returned as a \code{\link[sp:SpatialGridDataFrame]{SpatialGridDataFrame}}}
}
\value{
List with the following items:
\describe{
\item{\code{"raster"}}{A smooth raster, which is either a \code{\link[sp:SpatialGridDataFrame]{SpatialGridDataFrame}} or a \code{\link[raster:Raster-class]{RasterLayer}} (see \code{to.Raster})}
\item{\code{"iso"}}{Contour lines, which is a \code{\link[sp:SpatialLinesDataFrame]{SpatialLinesDataFrame}}}
\item{\code{"dasy"}}{Dasymetric polygons, which is a \code{\link[sp:SpatialPolygonsDataFrame]{SpatialPolygonsDataFrame}}}
\item{\code{"bbox"}}{Bounding box of the used raster}
\item{\code{"ncol"}}{Number of rows in the raster}
\item{\code{"nrow"}}{Number of columns in the raster}
}
}
\description{
Create contour lines (isolines) from a shape object. To make the iso lines smooth, a 2D kernal density estimator is applied on the shape object. These lines are used to draw an isopleth. Also, the polygons between the countour lines are returned. They can be used to create a dasymetric map.
}
\details{
For the estimation of the 2D kernal density, code is borrowed from \code{\link[KernSmooth:bkde2D]{bkde2D}}. This implemention is slightly different: \code{\link[KernSmooth:bkde2D]{bkde2D}} takes point coordinates and applies linear binning, whereas in this function, the data is already binned, with values 1 if the values of \code{var} are not missing and 0 if values of \code{var} are missing.
}

