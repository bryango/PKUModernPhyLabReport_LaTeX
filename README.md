# PKUModernPhyLabReport_LaTeX
LaTeX lab report for modern physics experiments @ PKU. <br/>
北京大学物理学院 近代物理实验报告 - 2017秋 + 2019春

## PDF
> `# git ls-files | grep -E '^[^/]+/[^/]+.pdf$'`
> [1.1. 电子衍射 / ediff.pdf](1.1.%20电子衍射/ediff.pdf)<br/>
> [1.2. 扫描隧穿 / stm.pdf](1.2.%20扫描隧穿/stm.pdf)<br/>
> [1.3. 放电激光 / laser.pdf](1.3.%20放电激光/laser.pdf)<br/>
> [1.4. 贝塔射线 / beta.pdf](1.4.%20贝塔射线/beta.pdf)<br/>
> [1.5. 霍尔系数 / silicon.pdf](1.5.%20霍尔系数/silicon.pdf)<br/>
> [1.6. 扫描电镜 / sem.pdf](1.6.%20扫描电镜/sem.pdf)<br/>
> [1.7. 康普顿散射 / compton.pdf](1.7.%20康普顿散射/compton.pdf)<br/>
>
> [2.1. 核磁共振 / nmr.pdf](2.1.%20核磁共振/nmr.pdf)<br/>
> [2.2. 穆斯堡尔效应 / mossbauer.pdf](2.2.%20穆斯堡尔效应/mossbauer.pdf)<br/>
> [2.3. 核磁成像 / mri.pdf](2.3.%20核磁成像/mri.pdf)<br/>
> [2.4. 闪烁谱仪 / spectrum.pdf](2.4.%20闪烁谱仪/spectrum.pdf)<br/>
> [2.5. 对流斑图 / convection.pdf](2.5.%20对流斑图/convection.pdf)<br/>
> [2.6. 磁光克尔 / moke.pdf](2.6.%20磁光克尔/moke.pdf)<br/>
>
> 报告：[利用 Notebook 计算并记录能谱](2.4.%20闪烁谱仪/beamer/experiment_talk.pdf)

* 提供近代实验报告供大家参考 ~
* 遵循 [CC BY-NC-SA-4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可协议
* 请使用 XeLaTeX 编译，编辑器选用 UTF-8 编码
* 导言区（preamble）略微混乱，有许多曾经用过没有删掉的宏包，欢迎精简

P.S. 项目参考了 [chaserhkj/ModPhyLab](https://github.com/chaserhkj/ModPhyLab), 特此表示感谢～

## 依赖关系
* 所有报告共用根目录下的 `BibStyle/` 和 `PKUPhy.png`
* 第二部分（编号 `2.*.`）的报告共用 `preamble.tex` 和 `MathUtils.m`
* 有的 Mathematica 文档中引用了别处的 `MathUtils.m` 或未附上的 `*.bmp` 源文件，可能需要修正后方可正常运行

_Bryan_
