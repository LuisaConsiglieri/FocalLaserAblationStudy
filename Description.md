# Description
> [!NOTE] 
> Description is in the process of being written.

## Repository structure
The repository includes files such as README.md, LICENSE, CODE_OF_CONDUCT.md, SECURITY.md,
and the following directories, which contain the computer code for research on modeling Focal Laser Ablation (FLA). 
* [Data](#data-directory-contents)
* [Source](#graphical-representations-of-the-source-s-directory-contents)

## Data directory contents

### [data_geometry.m](data/data_geometry.m)
This script stores the geometric parameters [mm].
In this script, the value L0 is set to zero. However, the present code allows other values for L0.

### [initial_data.m](data/initial_data.m)
This script stores the initial data [mm]. References of the optical parameters [cm]:

- Jacques, S. Optical properties of biological tissues: A review. Phys. Med. Biol. 2013, 58, R37-R61. https://doi.org/10.1088/0031-9 155/58/11/R37
- Sandell, J.; Zhu, T. A review of in-vivo optical properties of human tissues and its impact on PDT. J. Biophotonics 2011, 4, 773-787. https://doi.org/10.1002/jbio.201100062
- Niemz, M. Laser-tissue interactions: Fundamentals and applications. Springer-Verlag, 2007.
- Capart, A.; Ikegaya, S.; Okada, E.; Machida, M.; Hoshi, Y. Experimental tests of indicators for the degree of validness of the diffusion approximation. J. Phys. Commun. 2021, 5. https://doi.org/10.1088/2399-6528/abe4e1

### [data_source.m](data/data_source.m)
This script stores parameters for the source of scattered photons S [W/mm^3].

### [data_operating.m](data/data_operating.m)
This script stores the wavelengths and powers under study, and correspondent temporal pulse widths.

## Graphical representations of the source S directory contents

### [SourceGraphics_linear.m](SourceGraphicalRepresentations/SourceGraphics_linear.m)
This function produces 2-D plots to the source S(r_f,z) for the wavelengths and powers under study.

### [SourceGraphics_semilogy.m](SourceGraphicalRepresentations/SourceGraphics_semilogy.m)
This function produces 2-D plots, using a logarithmic scale for the y-axis, to the source S(r_f,z) for the wavelengths and powers under study.
