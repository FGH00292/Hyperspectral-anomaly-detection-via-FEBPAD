# Hyperspectral-anomaly-detection-via-integration-of-feature-extraction-and-background-purification
This is the implementation of article: ["Hyperspectral anomaly detection via integration of feature extraction and background purification"](https://ieeexplore.ieee.org/document/9115873).
# Usage
Run "**demo.m**" after setting potimal parameters p, r and k.
# Description
* **demo.m** ---------- main file
  * **FEBPAD.m** ---------- implementation of the proposed algorithm;
    * **FrFT.m** ---------- fractional Fourier Transformation;
    * **GRX_adv.m** ---------- modified GRX with given background atoms;
    * **RC_LRASMD.m** ---------- row-constrained low-rank and sparse matrix decomposition;
* **ROC.m**----------Calculate the AUC value with given detection map.
# Reference
If you find the code helpful, please kindly cite the following paper:
* Plain Text:<br>
Y. Ma, G. Fan, Q. Jin, J. Huang, X. Mei and J. Ma, "Hyperspectral Anomaly Detection via Integration of Feature Extraction and Background Purification," in IEEE Geoscience and Remote Sensing Letters, doi: 10.1109/LGRS.2020.2998809.
* BibTeX:<br>
@ARTICLE{9115873,<br>
  author={Y. {Ma} and G. {Fan} and Q. {Jin} and J. {Huang} and X. {Mei} and J. {Ma}},<br>
  journal={IEEE Geoscience and Remote Sensing Letters}, <br>
  title={Hyperspectral Anomaly Detection via Integration of Feature Extraction and Background Purification}, <br>
  year={2020},<br>
  volume={},<br>
  number={},<br>
  pages={1-5},}<br>
