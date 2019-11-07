file="temp/Codescape.GNU.Tools.Package.2019.09-01.for.MIPS.MTI.Bare.Metal.CentOS-6.x86_64.tar.gz"
if [ -f "$file" ]
then
	echo "$file found."
	cd temp
	sudo mkdir /opt/imgtec/
	sudo tar xvzf 'Codescape.GNU.Tools.Package.2019.09-01.for.MIPS.MTI.Bare.Metal.CentOS-5.x86_64.tar.gz' -C /opt/imgtec/
	
else
	echo "$file not found."
	mkdir temp
    cd temp

    #Get Codescape toolchain Bare Metal
	wget 'https://codescape.mips.com/components/toolchain/2019.09-01/Codescape.GNU.Tools.Package.2019.09-01.for.MIPS.MTI.Bare.Metal.CentOS-6.x86_64.tar.gz'
    sudo mkdir /opt/imgtec/
    sudo tar xvzf 'Codescape.GNU.Tools.Package.2019.09-01.for.MIPS.MTI.Bare.Metal.CentOS-6.x86_64.tar.gz' -C /opt/imgtec/
	    
fi

#libfdc Library
sudo mkdir /opt/imgtec/mips-mti-elf/2019.09-01/share/mips/addons/

cd ..
sudo unzip libfdc.zip -d /opt/imgtec/mips-mti-elf/2019.09-01/share/mips/addons/libfdc/

#Remove temp folder
#cd ..
#rm -r temp

sudo echo 'export MIPS_ELF_ROOT="/opt/imgtec/mips-mti-elf/2019.09-01"' >> ~/.bashrc

source ~/.bashrc
