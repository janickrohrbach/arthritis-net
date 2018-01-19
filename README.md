# Arthritis Net
Automated bone erosion scoring for rheumatoid arthritis with deep convolutional neural networks

## About
In fall 2017 I wrote a project thesis at the Zurich University of Applied Sciences, where I examined wheter bone erosion scores of patients with rheumatoid arthritis can be predicted wih deep convolutional neural networks. The networks were trained on cropped x-ray images of left hands. The code in this repository was used to obtain the results in the thesis.

The thesis can be found here: [/doc/project.pdf](../master/doc/project.pdf)

All jupyter notebooks can be run on the following docker container: [tensorflow:1.4.0-gpu-py3](https://gcr.io/tensorflow/tensorflow:1.4.0-gpu-py3)

## Files
Below is a list of the files in this repository with a description of what they are used for.

| Filepath                                                    | Description   |
| ----------------------------------------------------------- | ------------- |
| [/correlation_analysis/correlation_analysis.ipynb](../master/correlation_analysis/correlation_analysis.ipynb)     | Jupyter Notebook that shows correlations between the Rau-score and the DAS-score |
| [/correlation_analysis/plots_for_thesis.Rmd](../master/correlation_analysis/plots_for_thesis.Rmd)     | R-Markdown file used to create the correlation plots for the thesis |
| [arthritis-net/doc/img/](../master/doc/img/)     | This folder contains all images used in the thesis |
| [arthritis-net/doc/project.pdf](../master/doc/project.pdf)     | The thesis |
| [arthritis-net/doc/project.tex](../master/doc/project.tex)     | The LaTex file for the thesis|
| [arthritis-net/doc/project.tex](../master/doc/project.tex)     | The BibTex file with the references of the thesis|


 
