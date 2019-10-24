# MIPS_FPGA

To be able to compile perform the following:

1. Download the Codescape GNU Tools 2019.09-01 Binaries (MTI Bare Metal Toolchain) [https://codescape.mips.com/components/toolchain/2019.09-01/Codescape.GNU.Tools.Package.2019.09-01.for.MIPS.MTI.Bare.Metal.CentOS-6.x86_64.tar.gz]

2. Extract the content of the Codescape GNU Tools 2019.09-01 Binaries and save it as root in ``` /opt/imgtec/```

3. Download the libfdc library from [https://drive.google.com/file/d/10TgHjtclrGBjBHI--cCveerP63LNu7JM/view?usp=sharing]

4. Extract the file and save as root in ```/opt/imgtec/mips-mti-elf/2019.09-01/share/mips/addons/```

5. Now you will set your environment variables by editing the .barshrc file. In the command promt perform:
```console
foo@bar:~$ cd ~
foo@bar:~$ sudo gedit .bashrc
```

At the end of .bashrc add the following
```bash
export MIPS_ELF_ROOT="/opt/imgtec/mips-mti-elf/2019.09-01"
```

6. Now you can run ```make``` on your projects.
