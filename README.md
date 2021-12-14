# Hyperspectral anomaly detection
This is the implementation of article: ["Hyperspectral anomaly detection via integration of feature extraction and background purification"](https://ieeexplore.ieee.org/document/9115873).
# Usage
Run "**demo.m**" after setting optimal parameters p, r and k.
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
Y. Ma, G. Fan, Q. Jin, J. Huang, X. Mei and J. Ma, "Hyperspectral Anomaly Detection via Integration of Feature Extraction and Background Purification," in IEEE Geoscience and Remote Sensing Letters, vol. 18, no. 8, pp. 1436-1440, Aug. 2021, doi: 10.1109/LGRS.2020.2998809.
* BibTeX:<br>
@ARTICLE{9115873,<br>
  author={Ma, Yong and Fan, Ganghui and Jin, Qiwen and Huang, Jun and Mei, Xiaoguang and Ma, Jiayi},<br>
  journal={IEEE Geoscience and Remote Sensing Letters}, <br>
  title={Hyperspectral Anomaly Detection via Integration of Feature Extraction and Background Purification}, <br>
  year={2021},<br>
  volume={18},<br>
  number={8},<br>
  pages={1436-1440},<br>
  doi={10.1109/LGRS.2020.2998809}}<br>
