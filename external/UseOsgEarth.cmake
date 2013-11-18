# Add external project osgBullet
# Pro Trick here: we can't pass the string directly as a CMAKE_ARG in 
# ExternalProject_Add, because it would keep the double quotes, and we
# do not want them. Passing it as a variable removes the dobule quotes.
#set(BulletInstallType "Source And Build Tree")
#set(OsgInstallType "Source And Build Tree")

# The OSGWORKS_STATIC preprocessor definition tells osgBullet that
# we are using the static version of osgWorks.
set(OSGEARTH_GENERATOR ${CMAKE_GENERATOR})

set(OSGEARTH_ARGS
	   -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
     -DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/osg/osgPlugins-3.3.0
     -DOSGEARTH_USE_QT=OFF
     -DOSG_DIR:PATH=${OSG_INSTALL_DIR}
     -DGDAL_INCLUDE_DIR=${GDAL_INCLUDE_DIR}
     -DGDAL_LIBRARY=${GDAL_LIBRARY}
)

if(WIN32)
	set(OSGEARTH_ARGS
		   -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
		 -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}/osgPlugins-3.3.0
		 -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}/osgPlugins-3.3.0
		 -DCMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}/osgPlugins-3.3.0
		 -DCMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}/osgPlugins-3.3.0
		 -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG}/osgPlugins-3.3.0
		 -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE}/osgPlugins-3.3.0
		 #-DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osgPlugins-3.3.0
		 #-DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/osgPlugins-3.3.0
		 #-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/osgPlugins-3.3.0
		 #-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/osgPlugins-3.3.0
		 -DOSGEARTH_USE_QT=OFF
		 -DOSG_DIR:PATH=${OSG_INSTALL_DIR}
		 -DGDAL_INCLUDE_DIR=${GDAL_INCLUDE_DIR}
		 -DGDAL_LIBRARY=${GDAL_LIBRARY}
	)
	# On windows, we specify all the dependencies manually. It's the only
	# way that seems to work. And it's super fun to do.
    set(OSGEARTH_ARGS
        #-DCMAKE_SHARED_LINKER_FLAGS:STRING="${CMAKE_SHARED_LINKER_FLAGS} /NODEFAULTLIB:msvcprt.lib /NODEFAULTLIB:libcpmt.lib"
		#    -DCMAKE_LINKER_FLAGS:STRING="${CMAKE_LINKER_FLAGS} /NODEFAULTLIB:libcpmt.lib /NODEFAULTLIB:msvcprt.lib"
			#osg
			-DOSG_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSG_LIBRARY:PATH=${osg_LIBRARY}
			-DOSG_LIBRARY_DEBUG:PATH=${osg_LIBRARY_DEBUG}
			#osgGA
			-DOSGGA_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGGA_LIBRARY:PATH=${osgGA_LIBRARY}
			-DOSGGA_LIBRARY_DEBUG:PATH=${osgGA_LIBRARY_DEBUG}
			#osgText
			-DOSGTEXT_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGTEXT_LIBRARY:PATH=${osgText_LIBRARY}
			-DOSGTEXT_LIBRARY_DEBUG:PATH=${osgText_LIBRARY_DEBUG}
			#osgViewer
			-DOSGVIEWER_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGVIEWER_LIBRARY:PATH=${osgViewer_LIBRARY}
			-DOSGVIEWER_LIBRARY_DEBUG:PATH=${osgViewer_LIBRARY_DEBUG}
			#osgSim
			-DOSGSIM_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGSIM_LIBRARY:PATH=${osgSim_LIBRARY}
			-DOSGSIM_LIBRARY_DEBUG:PATH=${osgSim_LIBRARY_DEBUG}
			#osgDB
			-DOSGDB_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGDB_LIBRARY:PATH=${osgDB_LIBRARY}
			-DOSGDB_LIBRARY_DEBUG:PATH=${osgDB_LIBRARY_DEBUG}
			#osgUtil
			-DOSGUTIL_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGUTIL_LIBRARY:PATH=${osgUtil_LIBRARY}
			-DOSGUTIL_LIBRARY_DEBUG:PATH=${osgUtil_LIBRARY_DEBUG}
			#osgShadow
			-DOSGSHADOW_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGSHADOW_LIBRARY:PATH=${osgShadow_LIBRARY}
			-DOSSHADOW_LIBRARY_DEBUG:PATH=${osgShadow_LIBRARY_DEBUG}
			#openthreads
			-DOPENTHREADS_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOPENTHREADS_LIBRARY:PATH=${OpenThreads_LIBRARY}
			-DOPENTHREADS_LIBRARY_DEBUG:PATH=${OpenThreads_LIBRARY_DEBUG}
			#osgFX
			-DOSGFX_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGFX_LIBRARY:PATH=${osgFX_LIBRARY}
			-DOSGFX_LIBRARY_DEBUG:PATH=${osgFX_LIBRARY_DEBUG}
			#osgTerrain
			-DOSGTERRAIN_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGTERRAIN_LIBRARY:PATH=${osgTerrain_LIBRARY}
			-DOSGTERRAIN_LIBRARY_DEBUG:PATH=${osgTerrain_LIBRARY_DEBUG}
			#osgManipulator
			-DOSGMANIPULATOR_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGMANIPULATOR_LIBRARY:PATH=${osgManipulator_LIBRARY}
			-DOSGMANIPULATOR_LIBRARY_DEBUG:PATH=${osgManipulator_LIBRARY_DEBUG}
			#osgWidget
			-DOSGWIDGET_INCLUDE_DIR:PATH=${OSG_INCLUDES}
			-DOSGWIDGET_LIBRARY:PATH=${osgWidget_LIBRARY}
			-DOSGWIDGET_LIBRARY_DEBUG:PATH=${osgWidget_LIBRARY_DEBUG}
			#CURL
			-DCURL_INCLUDE_DIR:PATH=${CMAKE_BINARY_DIR}/gdal/include/curl
			-DCURL_LIBRARY:PATH=${CMAKE_BINARY_DIR}/gdal/lib/libcurl_imp.lib
			-DCURL_LIBRARY_DEBUG:PATH=${CMAKE_BINARY_DIR}/gdal/lib/libcurl_imp.lib
			#ZLIB
			-DZLIB_INCLUDE_DIR:PATH=${CMAKE_BINARY_DIR}/gdal/include/
			-DZLIB_LIBRARY:PATH=${CMAKE_BINARY_DIR}/gdal/lib/zlib.lib
		${OSGEARTH_ARGS}
    )
endif(WIN32)

ExternalProject_Add(
    osgearth
    DEPENDS osg gdal
    #GIT_REPOSITORY https://github.com/gwaldron/osgearth.git
	URL https://omegalib.googlecode.com/files/osgearth-10db273f4f.zip
    CMAKE_GENERATOR ${OSGEARTH_GENERATOR}
    CMAKE_ARGS
        ${OSGEARTH_ARGS}
    INSTALL_COMMAND ""
)

set_target_properties(osgearth PROPERTIES FOLDER "modules/omegaOsgEarth")


#set_target_properties(osgearth PROPERTIES FOLDER "3rdparty")

#set(OSGEARTH_BASE_DIR ${CMAKE_BINARY_DIR}/modules/omegaOsgEarth/osgearth-prefix/src)
# NOTE: setting the OSGEARTH_INCLUDES as an internal cache variable, makes it accessible to other modules.
#set(OSGEARTH_INCLUDES ${OSGEARTH_INCLUDES} ${OSGEARTH_BASE_DIR}/osgEarth/include CACHE INTERNAL "")

#set(OSGEARTH_LIB_DIR ${OSGEARTH_BASE_DIR}/osgearth-build/lib)

#include_directories(${OSG_INCLUDES})
