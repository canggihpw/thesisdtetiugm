# Latex Template for Thesis Writing at DTETI UGM

## Info

This template can be used for a bachelor, master, and doctoral thesis at DTETI UGM, even though for the last one, it still can be considered as a "beta" release. Send me an email or create a pull request if you have improvements for this template.

## What's new

[2020-01-28] You can use command **\printendorsementpdf** to include your pdf file containing the endorsement. Otherwise, use **\printendorsement**

## How-to-use

Read the detailed information in **thesis_template.tex**.
In case some **sty files** are not available in your TeX installation, just copy the required one from **packages/** directory into the same directory as **thesis_template.tex**. Hopefully, this will help beginner users.

## Contents

### Main files

```plaintext
|-- thesisdtetiugm.cls (Class file)
|-- thesis_template.tex (The template file)
```

### Content directory

This directory and the subdirectories are not compulsory. I arranged it in such a way as to make it easier in writing.

```plaintext
|-- contents/
    |-- nomenclature/
        |-- nomenclature.tex
    |-- statement/
        |-- statement.tex
    |-- endorsement/
        |-- endorsement.pdf
    |-- preface/
        |-- preface.tex
    |-- abstract/
        |-- abstract.tex
        |-- intisari.tex
    |-- chapter-1/
        |-- chapter-1.tex
    |-- chapter-2/
        |-- chapter-2.tex
    |-- chapter-3/
        |-- chapter-3.tex
    |-- chapter-4/
        |-- chapter-4.tex
    |-- chapter-5/
        |-- chapter-5.tex
    |-- appendix/
        |-- appendix.tex
```

### Bibtex

Contains `references.bib` as your centralized BibTeX file and `IEEEtran.bst` as a BibTeX formatter following IEEE Transactions format.

### Codes

Your program codes are stored here. Using some more tweaking, a python code can be run from inside LaTeX and the output will be embedded inside the output pdf.

### Equations

Centralized compilable equations. You can compile the equations only pdf here, or call it from your `contents/*.tex` file. To make separated compiled equations, run `contents/equations-wrapper.tex`.

### Images

Your images sit here.

### Additional files

```plaintext
|-- packages/ (Additional sty files for helping beginner users)
```

## License

MIT License
