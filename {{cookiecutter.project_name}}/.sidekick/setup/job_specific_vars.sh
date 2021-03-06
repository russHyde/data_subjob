#!/bin/bash -e

###############################################################################
# User-specified variables for use in the `{{cookiecutter.project_name}}`
# project

###############################################################################
# `JOBNAME` and `IS_R_REQUIRED` must be defined for each new project
#
# `IS_R_REQUIRED=1` if R is to be used in addition to pythono within the current
# project
# `IS_R_PKG_REQUIRED=1` is required if an R package is to be made
# `IS_JUPYTER_R_REQUIRED=1` is required if an R kernel is to be made

export JOBNAME="{{cookiecutter.project_name}}"
export IS_R_REQUIRED={{cookiecutter.is_r_required}}
export IS_R_PKG_REQUIRED={{cookiecutter.is_r_pkg_required}}
export IS_JUPYTER_R_REQUIRED={{cookiecutter.is_jupyter_r_kernel_required}}

###############################################################################
# PKGNAME is the name of the job-specific R package
# - Note that the R-package <PKGNAME> will be initialised in
# ./lib/local/<PKGNAME>.
# - User should add files to ./lib/local/<PKGNAME>/R/ to make a usable package
# (the package will be installed during ./sidekick setup)

if [[ ! -z "${IS_R_PKG_REQUIRED}" ]] && [[ ${IS_R_PKG_REQUIRED} -ne 0 ]];
then
  export PKGNAME="{{cookiecutter.r_pkg_name}}"
fi

# ENVNAME is the name of the job-specific conda environment
export ENVNAME="{{cookiecutter.conda_env}}"

###############################################################################
if [[ ! -z "${IS_JUPYTER_R_REQUIRED}" ]] && [[ ${IS_JUPYTER_R_REQUIRED} -ne 0 ]];
then
  export R_KERNEL="conda-env-${ENVNAME}-r"
fi
