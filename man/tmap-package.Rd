% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pkg.R
\docType{package}
\name{tmap-package}
\alias{tmap}
\alias{tmap-package}
\title{Thematic Maps}
\description{
Thematic maps are geographical maps in which statistical data are visualized. This package offers a flexible, layer-based, way to create thematic maps, such as choropleths and bubble maps. It is based on the grammar of graphics, and resembles the syntax of ggplot2.
}
\details{
This page provides a brief overview of all package functions. See \href{../doc/tmap-nutshell.html}{\code{vignette("tmap-nutshell")}} for a short manual with examples.
}
\section{Quick plotting method}{

\tabular{ll}{
\code{\link{qtm}}\tab To plot a thematic map \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}
}

\section{Main plotting method}{

Shape specification:
\tabular{ll}{
\code{\link{tm_shape}}\tab To specify a shape object \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}

Aesthetics layers:
\tabular{ll}{
\code{\link{tm_fill}}\tab To create a polygon layer (without borders) \cr
\code{\link{tm_borders}}\tab To create polygon borders \cr
\code{\link{tm_polygons}}\tab To create a polygon layer with borders \cr
\code{\link{tm_bubbles}}\tab To create a layer of bubbles \cr
\code{\link{tm_dots}}\tab To create a layer of dots \cr
\code{\link{tm_lines}}\tab To create a layer of lines \cr
\code{\link{tm_raster}}\tab To create a raster layer \cr
\code{\link{tm_text}}\tab To create a layer of text labels \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}

Facetting (small multiples)
\tabular{ll}{
\code{\link{tm_facets}}\tab To define facets \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}

Attributes:
\tabular{ll}{
\code{\link{tm_grid}}\tab To create grid lines \cr
\code{\link{tm_scale_bar}}\tab To create a scale bar \cr
\code{\link{tm_compass}}\tab To create a map compass \cr
\code{\link{tm_credits}}\tab To create a text for credits \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}

Layout element:
\tabular{ll}{
\code{\link{tm_layout}}\tab To adjust the layout (main function)\cr
\code{\link{tm_legend}}\tab Shortcut to adjust the legend \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}
}

\section{Handy tool functions}{
 
\tabular{ll}{
\code{\link{bb}}\tab To create, extract or modify a bounding box \cr
\code{\link{get_asp_ratio}}\tab To get the aspect ratio of a shape object \cr
\code{\link{get_IDs}}\tab To get ID values of a shape object \cr
\code{\link{append_data}}\tab To append a data frame to a shape object \cr
\code{\link{approx_areas}}\tab To approximate area sizes of polygons \cr
\code{\link{calc_densities}}\tab To calculate density values \cr
\code{\link{get_projection}}\tab To get the map projection \cr
\code{\link{set_projection}}\tab To set the map projection \cr
\code{\link{split}}\tab To split a shape object \cr
\code{\link{sbind}}\tab To bind shape objects \cr
\code{\link{map_coloring}}\tab To color polygons with different colors for adjacent polygons \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}
}

\section{Generate spatial objects}{
 
\tabular{ll}{
\code{\link{smooth_map}}\tab To create a smooth map (raster, contour lines and dasymetric polygons) \cr
\code{\link{smooth_raster_cover}}\tab To create a smooth cover of a raster object \cr
\code{\link{sample_dots}}\tab To sample dots from polygons \cr
\code{\link{points_to_raster}}\tab To bin spatial points to a raster \cr
\code{\link{poly_to_raster}}\tab To convert polygons to a raster \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}
}

\section{Input functions}{
 
\tabular{ll}{
\code{\link{read_shape}}\tab To read a shape object \cr
\code{\link{read_GPX}}\tab To read a GPX file \cr
\code{\link{read_osm}}\tab To read Open Street Map data \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}
}

\section{Output functions}{
 
\tabular{ll}{
\code{\link{itmap}}\tab Interactive tmap widget \cr
\code{\link{animation_tmap}}\tab Create an animation \cr
\code{\link{save_tmap}}\tab To save thematic maps \cr
\code{\link{write_shape}}\tab To write a shape object \cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}
}

\section{Spatial datasets}{
 
\tabular{ll}{
\code{\link{World}}\tab World country data (spatial polygons) \cr
\code{\link{Europe}}\tab European country data (spatial polygons) \cr
\code{\link{NLD_prov}}\tab Netherlands province data (spatial polygons) \cr
\code{\link{NLD_muni}}\tab Netherlands municipal data (spatial polygons) \cr
\code{\link{metro}}\tab Metropolitan araes (spatial points) \cr
\code{\link{rivers}}\tab Rivers (spatial lines) \cr
\code{\link{land}}\tab Global land cover (spatial grid)\cr
--------------------------- \tab --------------------------------------------------------------------------------------------------- \cr
}
}
\author{
Martijn Tennekes \email{mtennekes@gmail.com}
}
\seealso{
\href{../doc/tmap-nutshell.html}{\code{vignette("tmap-nutshell")}}
}
\keyword{GIS,}
\keyword{bubble}
\keyword{choropleth,}
\keyword{map}
\keyword{maps,}
\keyword{statistical}
\keyword{thematic}

