#
# Copyright (c) 2026
#
# SPDX-License-Identifier: MIT
#

# In zsh the value of $0 depends on the FUNCTION_ARGZERO option which is
# set by default. FUNCTION_ARGZERO, when it is set, sets $0 temporarily
# to the name of the function/script when executing a shell function or
# sourcing a script. POSIX_ARGZERO option, when it is set, exposes the
# original value of $0 in spite of the current FUNCTION_ARGZERO setting.
#
# Note: The version of zsh need to be 5.0.6 or above. Any versions below
# 5.0.6 maybe encounter errors when sourcing this script.
if [ -n "${ZSH_VERSION:-}" ]; then
	dir="${(%):-%N}"
else
	dir="${BASH_SOURCE[0]}"
fi

# identify source tree root directory
WORKSPACE_BASE=$( builtin cd "$( dirname "$dir" )" > /dev/null && pwd)

# set the SDK environment variables
SDK_ROOT=${WORKSPACE_BASE}/../../sdk
SDK_ENV=environment-setup-cortexa57-oe-linux

# set the build directory for the build system
source ${SDK_ROOT}/${SDK_ENV}
