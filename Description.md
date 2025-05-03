# Description

> [!NOTE] 
> Description is in the process of being written.

## Repository structure

The repository includes files such as README.md, LICENSE, CODE_OF_CONDUCT.md, SECURITY.md,
and the following directories, which contain the computer code for research on modeling Focal Laser Ablation (FLA). 
* [Data](#data-directory-contents)
* [Source](#graphical-representations-of-the-source-s-directory-contents)
* [Exact solutions](#exact-solutions-directory-contents)

## Data directory contents

### [data_geometry.m](data/data_geometry.m)

This script stores the geometric parameters only [mm]. In this script, the value L0 is set to zero. However, the present code allows other values for L0.

### [initial_data.m](Data/initial_data.m)

This script stores the initial data [mm], including the geometric parameters. References of the optical parameters [cm]:

- Jacques, S. Optical properties of biological tissues: A review. Phys. Med. Biol. 2013, 58, R37-R61. https://doi.org/10.1088/0031-9 155/58/11/R37
- Sandell, J.; Zhu, T. A review of in-vivo optical properties of human tissues and its impact on PDT. J. Biophotonics 2011, 4, 773-787. https://doi.org/10.1002/jbio.201100062
- Niemz, M. Laser-tissue interactions: Fundamentals and applications. Springer-Verlag, 2007.
- Capart, A.; Ikegaya, S.; Okada, E.; Machida, M.; Hoshi, Y. Experimental tests of indicators for the degree of validness of the diffusion approximation. J. Phys. Commun. 2021, 5. https://doi.org/10.1088/2399-6528/abe4e1

### [data_source.m](Data/data_source.m)

This script stores parameters for the source of scattered photons $S$.

### [data_operating.m](Data/data_operating.m)

This script stores the wavelengths and powers under study, and correspondent temporal pulse widths.

### [data_work.m](Data/data_work.m)

This script stores the working parameters, according to Appendices A and B https://doi.org/10.3390/photonics12040400 .

## Graphical representations of the source S directory contents

The folder SourceGraphics deals with the source of the scattered photons $S$ [W/mm$^3$], defined in (2) [Consiglieri, 2025a], and its graphical representations in Figure 2 [Consiglieri, 2025a].

[Consiglieri, 2025a] Consiglieri, Luisa. Exact solutions to cancer laser ablation modeling. arXiv:2503.07226 [math.AP] (2025) https://doi.org/10.48550/arXiv.2503.07226

```mermaid
graph TD;
A[initial_data.m]-->C[SourceGraphics_breast.m];
B[data_source.m]-->C;
A-->D[SourceGraphics_prostate.m];
B-->D;
C--SourceGraphics_linear.m-->E[Figure 2a];
C--SourceGraphics_semilogy.m-->F[Figure 2b];
D--SourceGraphics_linear.m-->G[Figure 2c];
D--SourceGraphics_semilogy.m-->H[Figure 2d];
```

>The wavelengths and powers under study are to simulate two types of lasers:
>
>> Q-switched short-pulsed Nd:YAG laser operating at a wavelength of 1064 nm and power of 1.3 W;
>>
>> diode short-pulsed laser operating at wavelengths of
>> 
>>> 810 nm and power of 5 W;
>>> 
>>> 980 nm and powers of 1.3 W and 5 W.


### [SourceGraphics_linear.m](SourceGraphicalRepresentations/SourceGraphics_linear.m)

This function produces 2-D plots to the source $S(r_\mathrm{f},z)$ for the wavelengths and powers under study. This function assumes that the input arguments z1, source1, z2, and source2 are all properly defined and have the correct dimensions when calling the function.

### [SourceGraphics_semilogy.m](SourceGraphicalRepresentations/SourceGraphics_semilogy.m)

This function produces 2-D plots, using a logarithmic scale for the y-axis, to the source $S(r_\mathrm{f},z)$ for the wavelengths and powers under study. This function assumes that the input arguments z1, source1, z2, and source2 are all properly defined and have the correct dimensions when calling the function.

### [SourceGraphics_breast.m](SourceGraphicalRepresentations/SourceGraphics_breast.m)

This script illustrates the graphical representations to the source $S(r_\mathrm{f},z)$ in the tumor-healthy breast tissue. 

### [SourceGraphics_prostate.m](SourceGraphicalRepresentations/SourceGraphics_prostate.m)

This script illustrates the graphical representations to the source $S(r_\mathrm{f},z)$ in the tumor-healthy prostate tissue.

## Exact solutions directory contents

The folder ExactSolutions deals with the fluence rate $\phi$, and its graphical representations in Figure 3 [Consiglieri, 2025].

[Consiglieri, 2025] Consiglieri, Luisa. Exact Solutions to Cancer Laser Ablation Modeling. Photonics 12 :4 (2025), 400. https://doi.org/10.3390/photonics12040400 .

### [Zsolution.m](ExactSolutions/Zsolution.m)

This function computes the fluence rate as function on the longitudinal coordinate $z$. This function assumes that the input argument (mu_t, eta, zz, ell, index_z) is provided correctly when calling the function. As defined in [initial_data.m](Data/initial_data.m):
* mu_t stands for total attenuation coefficient $\mu_\mathrm{t}$ [mm$^{-1}$];
* zz stands for the longitudinal coordinate $z$;
* ell stands for the longitudinal distance $z = \ell$, corresponding to the tumor-healthy interface;
* index_z stands for the relevant indices of zz, namely the tumor-healthy interface and outer boundary $z = L$,
while eta is the parameter $\eta\in\mathbb{R}$.
