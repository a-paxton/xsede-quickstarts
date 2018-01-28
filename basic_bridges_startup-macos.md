# Bridges quickstart

1. Log into the XSEDE Single Sign-On (SSO) Hub: `ssh username@login.xsede.org`
    1. Log in with your XSEDE username and password
    1. **Note**: Must have Duo multi-factor authentication enabled (https://portal.xsede.org/mfa)
1. Log into Bridges: `gsissh bridges`
    1. Note the path information: `username@br###`
        1. This will be your "head node" (a randomly assigned login node). This means it'll change each time you log in. This may cause problems with programs like GNU Screen or TMUX (similar to byobu).
        1. Keeping track of your assigned node will allow us to preserve all of our work if our connection is interrupted.
        1. **Note***: Head nodes are not intended for long-term use. Any long-running processes on head nodes will be terminated by the system *automatically*.
1. Start TMUX (which also runs GNU Screen): `tmux`
    1. If disconnected from your old node and assigned a different (new) node upon login, re-access your old node and TMUX session:
        1. From your new Terminal, log into that old node: `ssh br###`
        1. In your new terminal, restart the same version of tmux: `tmux attach`
1. Load desired modules.
    1. To see currently loaded modules: `module list`
    1. To see all available modules: `module avail`
    1. To load a specific module: `module load module_name`
    1. **Note**: By default, Bridges loads the Intel compiler. Keep in mind that this may affect any compiling later (e.g., R libraries).
        1. This differs from Jetstream, which utilizes the GCC compiler. If needed, you may load a GCC compiler module. If attempting to run something on Bridges that was already running on Jetstream, it is preferable to load the closest version to the one running on the Jetstream instance being emulated.
1. Transfer data.
    1. If transferring local data, use Globus Connect Personal.
        1. Follow download instructions: https://docs.globus.org/how-to/globus-connect-personal-mac/
        1. Once the Bridges instance is running, navigate to "Web: Transfer Files" to begin data upload.
            1. Specify local files on lefthand side:
                1. Click "Endpoint"
                1. Click "Administered by me"
                1. Select files to be uploaded as needed.
            1. Specify remote location on righthand side:
                1. Needs to be figured out.
    1. Otherwise, fetch data from open website: `wget "http://your-url-here.com"`
    1. In Bridges, you have multiple work areas.
        1. `/home/username`: Head node location. Does not use resources. To access, may use global variable `$HOME` instead (e.g., `cd $HOME`).
        1. `/pylon_number/group_name/username`: Project location. All data should be stored here. To access, may use global variable `$PROJECT` instead (e.g., `cd $PROJECT`). For more on group names, see https://portal.xsede.org/psc-bridges#account:multiple.
1. Start processing.
    1. Start process on compute node: `srun command`
        1. To get a pseudoterminal on a compute node instead run: `srun --pty command`
    1. Start batch on compute node: `sbatch batch_file_name`
    1. Keep in mind the resources you're using.
        1. `srun` allows you to be interactive, but it spends compute resources the entire time it's running.
        1. `sbatch` is not interactive, but it stops the processes immediately upon finishing the scripts.

## Interactively editing using Atom
1. Download Atom: https://atom.io/.
1. Install the `atom-commander` package: Packages > Settings View > Install Packages/Themes > search for "atom-commander" > install
1. Toggle Atom Commander toolbar: Packages > Atom Commander > Toggle Focus
1. Press "alt" (after clicking on the Atom Commander toolbar) to bring up options.
1. Click "Servers", then "Add".
1. Follow the SFTP setup directions from XSEDE: https://portal.xsede.org/psc-bridges#transfer:sftp
1. After clicking the Atom Commander toolbar again, press "alt" to bring up options.
1. Click "Open".
1. Follow the prompts to log into your account.

## Python package installation
Because Bridges users do not have root access, we need to install everything locally in order to get it to work.

1. Package management with pip (thanks to https://gist.github.com/saurabhshri/46e4069164b87a708b39d947e4527298)
    1. To install pip for yourself (only needs to be done once):
        1. Download pip: `wget https://bootstrap.pypa.io/get-pip.py`
        1. Install: `python get-pip.py --user`
        1. Navigate to pip's new directory: `cd ~/.local/bin`
        1. Update your `$PATH` variable: `PATH=$PATH:~/.local/bin`
        1. Source new bash for changes to take effect: `source ~/.bashrc`
    1. To install/update packages with pip:
        1. For individual packages, run: `pip install package_name --user`
        1. For requirements files, run: `pip install -r requirements.txt --user`
1. Package management with conda
    1. To install conda for yourself (only needs to be done once):
        1. Download source: `wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh`
        1. Install: `bash Anaconda3-5.0.1-Linux-x86_64.sh`
        1. Change the default installation to be in (at least) the `.local` folder: `/home/username/.local/anaconda3`
        1. Follow the prompts as needed.

## Additional resources
* To see available software modules: https://portal.xsede.org/software#/
    * To load a resource, search for it by name, then click the desired software's name on the target resource.
* For an overview of software modules: https://www.psc.edu/index.php/user-resources/software/module
* For overview on PSC Bridges: https://portal.xsede.org/psc-bridges
* Various cheatsheets:
    * Bridges storage info: https://portal.xsede.org/psc-bridges#filespaces
    * See TMUX cheatsheet: https://tmuxcheatsheet.com/
    * See SLURM cheatsheets:
        * https://slurm.schedmd.com/pdfs/summary.pdf
        * https://www.chpc.utah.edu/presentations/SlurmCheatsheet.pdf
        * https://slurm.schedmd.com/faq.html
