#!/bin/bash -euf

source_gcc()
{
  local _gcc_path="${1}"
  local _filename="${2}"

  if [ ! -d "${_gcc_path}" ]; then

    printf "Downloading ${_filename}\n"
    curl --location "${deps_url}/${_filename}" --output "${_filename}"

    echo "Extracting ${_filename}"
    mkdir -p "${HOME}/.cache/compilers"
    [[ "${TRAVIS_OS_NAME}" == "linux" ]] \
      && tar -xf "${_filename}" -C "${HOME}/.cache/compilers" \
      || unzip -q "${_filename}" -d "${_gcc_path}"
    rm "${_filename}"

  fi
}

