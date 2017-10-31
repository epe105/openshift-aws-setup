# Getting Started

To use this project, you'll need (at minimum):

- Python 2 >=2.7.9 or Python 3 >=3.4

## Install

### GNU/Linux, or macOS

```sh
#!/bin/bash

GITUSER="ecwpz91"
git clone https://github.com/${GITUSER}/openshift-aws-setup.git
cd openshift-aws-setup
```

### No `git`? No problem!

```sh
#!/bin/bash

DIRPATH="${HOME}/Downloads/openshift-aws-setup"; GITUSER="ecwpz91"; RELEASE="master"
GITREPO="https://github.com/${GITUSER}/openshift-aws-setup/archive/${RELEASE}.zip"
ARCHIVE="$(printf "%s" "${GITREPO##*/}")"

# Download and extract
wget ${GITREPO} \
&& temp="$(mktemp -d)" \
&& unzip -d $temp ${ARCHIVE} \
&& mkdir -p ${DIRPATH} \
&& mv $temp/*/* ${DIRPATH} \
&& rm -rf $temp ${ARCHIVE} \
&& cd ${DIRPATH} \
&& unset DIRPATH GITUSER GITREPO ARCHIVE
```

## Setup

### Amazon Web Services (AWS)

1. Setup an [AWS account][1] with privileges to a `route53` registered domain
2. [Create and download your account's access key pair file][2] locally
3. Rename `setenv.sh.example` to `setenv.sh` and update it's variables
4. Create and save a hashed password to `$HOME/.ansible/.vault_pass.txt`
5. Setup your local deployment environment using the following script:

```sh
#!/bin/bash

source hack/init.sh
```

#### What does this script do?

- Installs Ansible and the [AWS CLI][4] locally via `pip`.

# Usage

## Deploy Red Hat OpenShift Container Platform (OCP)

This action requires a [subscription with Red Hat][5] with account credentials, or an [activation key][6].

```sh
source openshift-playbook.sh
```

# Credits

Originally inspired by Gerald Nunn's [openshift-aws-setup][7] project. Thanks!

[1]: https://aws.amazon.com/
[2]: http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html
[3]: https://pypi.python.org/pypi/virtualenv
[4]: http://docs.aws.amazon.com/cli/latest/userguide/cli-environment.html
[5]: https://www.redhat.com/en/about/value-of-subscription
[6]: https://access.redhat.com/articles/1378093
[7]: https://github.com/gnunn1/openshift-aws-setup
[8]: http://docs.ansible.com/ansible/latest/playbooks_vault.html
