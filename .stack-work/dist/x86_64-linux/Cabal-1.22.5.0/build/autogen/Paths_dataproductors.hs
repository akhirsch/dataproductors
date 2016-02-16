module Paths_dataproductors (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/andrew/projects/dataproductors/.stack-work/install/x86_64-linux/lts-5.3/7.10.3/bin"
libdir     = "/home/andrew/projects/dataproductors/.stack-work/install/x86_64-linux/lts-5.3/7.10.3/lib/x86_64-linux-ghc-7.10.3/dataproductors-0.1.0.0-FBufWoQ2EXj4DfMtluHI6f"
datadir    = "/home/andrew/projects/dataproductors/.stack-work/install/x86_64-linux/lts-5.3/7.10.3/share/x86_64-linux-ghc-7.10.3/dataproductors-0.1.0.0"
libexecdir = "/home/andrew/projects/dataproductors/.stack-work/install/x86_64-linux/lts-5.3/7.10.3/libexec"
sysconfdir = "/home/andrew/projects/dataproductors/.stack-work/install/x86_64-linux/lts-5.3/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "dataproductors_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "dataproductors_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "dataproductors_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dataproductors_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dataproductors_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
