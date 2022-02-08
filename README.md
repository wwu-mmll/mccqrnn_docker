[![Docker](https://github.com/wwu-mmll/mccqrnn_docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/wwu-mmll/mccqrnn_docker/actions/workflows/docker-publish.yml)

# MCCQRNN Docker
This repository provides an docker image for the MCCQRNN Model.

## Usage
Make sure you have installed docker and nvidia-docker.

To get the predictions simply run
```
$ docker pull ghcr.io/wwu-mmll/mccqrnn_docker
$ docker run -v /path/to/input:/input -v /path/to/otuput:/output ghcr.io/wwu-mmll/mccqrnn_docker
```

The input directory has to be filled with an `input.csv` file organized as in the [example.csv](example.csv).

## If you use this software please cite this publication

```
@article{doi:10.1126/sciadv.abg9471,
author = {Tim Hahn  and Jan Ernsting  and Nils R. Winter  and Vincent Holstein  and Ramona Leenings  and Marie Beisemann  and Lukas Fisch  and Kelvin Sarink  and Daniel Emden  and Nils Opel  and Ronny Redlich  and Jonathan Repple  and Dominik Grotegerd  and Susanne Meinert  and Jochen G. Hirsch  and Thoralf Niendorf  and Beate Endemann  and Fabian Bamberg  and Thomas Kröncke  and Robin Bülow  and Henry Völzke  and Oyunbileg von Stackelberg  and Ramona Felizitas Sowade  and Lale Umutlu  and Börge Schmidt  and Svenja Caspers  and Harald Kugel  and Tilo Kircher  and Benjamin Risse  and Christian Gaser  and James H. Cole  and Udo Dannlowski  and Klaus Berger },
title = {An uncertainty-aware, shareable, and transparent neural network architecture for brain-age modeling},
journal = {Science Advances},
volume = {8},
number = {1},
pages = {eabg9471},
year = {2022},
doi = {10.1126/sciadv.abg9471},

URL = {https://www.science.org/doi/abs/10.1126/sciadv.abg9471},
eprint = {https://www.science.org/doi/pdf/10.1126/sciadv.abg9471}
,
    abstract = { A network-based quantification of brain aging uncovers and fixes a fundamental problem of all previous approaches. The deviation between chronological age and age predicted from neuroimaging data has been identified as a sensitive risk marker of cross-disorder brain changes, growing into a cornerstone of biological age research. However, machine learning models underlying the field do not consider uncertainty, thereby confounding results with training data density and variability. Also, existing models are commonly based on homogeneous training sets, often not independently validated, and cannot be shared because of data protection issues. Here, we introduce an uncertainty-aware, shareable, and transparent Monte Carlo dropout composite quantile regression (MCCQR) Neural Network trained on N = 10,691 datasets from the German National Cohort. The MCCQR model provides robust, distribution-free uncertainty quantification in high-dimensional neuroimaging data, achieving lower error rates compared with existing models. In two examples, we demonstrate that it prevents spurious associations and increases power to detect deviant brain aging. We make the pretrained model and code publicly available. }
}
```