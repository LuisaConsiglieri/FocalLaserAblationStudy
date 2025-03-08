# Description
> [!NOTE] 
> Description is in the process of being written.

## Repository structure
The repository includes files such as README.md, LICENSE, CODE_OF_CONDUCT.md, SECURITY.md,
and the following directories, which contain the computer code for research on modeling Focal Laser Ablation (FLA). 
- [Data](##data)


## Data directory contents

### data_geometry.m
This script stores the geometric parameters [mm].
In this script, the value L0 is set to zero. However, the present code allows other values for L0.

### initial_data.m
This script stores the initial data [mm]. References of the optical parameters [cm]:

- Jacques, S. Optical properties of biological tissues: A review. Phys. Med. Biol. 2013, 58, R37-R61. https://doi.org/10.1088/0031-9 155/58/11/R37

- Sandell, J.; Zhu, T. A review of in-vivo optical properties of human tissues and its impact on PDT. J. Biophotonics 2011, 4, 773-787. https://doi.org/10.1002/jbio.201100062

- Niemz, M. Laser-tissue interactions: Fundamentals and applications. Springer-Verlag, 2007.

### data_source.m
This script stores parameters for the source of scattered photons S [W/mm^3].
