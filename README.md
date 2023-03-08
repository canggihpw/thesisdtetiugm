# Latex Template for Thesis Writing at DTETI UGM

## Info

This template can be used for a bachelor, master, and doctoral thesis at DTETI UGM, even though for the last one, it still can be considered as a "beta" release. Send me an email or create a pull request if you have improvements for this template.

## What's new

[2020-02-12] Delegated as semi-formal master thesis template. Major upgrades including (1) better support for bookmarks and highlight, (2) migrating master thesis format page margin to `left=3.5cm` and `2.5cm` for others, and (3) support multi-row table.

[2020-01-28] You can use command `\printendorsementpdf` to include your pdf file containing the endorsement. Otherwise, use `\printendorsement`

## Compiling PDF

The most simple way to compile LaTeX is to use an online compiler such as [Overleaf](https://www.overleaf.com/). One beginner-friendly option for offline compilation is to use [MiKTeX](https://miktex.org/) with [TeXstudio](https://www.texstudio.org/). Another great option is to use [Visual Studio Code](https://code.visualstudio.com/) powered with [Git](https://git-scm.com), [Grammarly](https://marketplace.visualstudio.com/items?itemName=znck.grammarly), [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker), and [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop).

> **Note**
>
> Use `alt` + `z` in VS Code to enable/disable line warping for an easier latex writing

To compile PDF using a command-line, you can use the below steps:

1. Change path to `main/`

    ```shell
    cd main
    ```

1. Compile to pdf

    For common compile:

    ```shell
    pdflatex.exe --synctex=1 --interaction=batchmode "thesis_template.tex"
    ```

    To include printing error:

    ```shell
    pdflatex.exe --synctex=1 --interaction=batchmode -file-line-error "thesis_template.tex"
    ```

    or

    ```shell
    pdflatex.exe --synctex=1 --interaction=nonstopmode "thesis_template.tex"
    ```

    Some packages require multiple runs such as:

    1. Updating `bib` and creating or using a new `\label`` require multiple compilations:

        ```shell
        pdflatex.exe --synctex=1 --interaction=batchmode "thesis_template.tex"
        bibtex "thesis_template"
        pdflatex.exe --synctex=1 --interaction=batchmode "thesis_template.tex"
        pdflatex.exe --synctex=1 --interaction=batchmode "thesis_template.tex"
        ```

    1. Using highlights (`\hly, \hlg, and \hlr`) require two times compilation:

        ```shell
        pdflatex.exe --synctex=1 --interaction=batchmode "thesis_template.tex"
        pdflatex.exe --synctex=1 --interaction=batchmode "thesis_template.tex"
        ```

    1. You can use the below commands to compile `summary_en` and `summary_id`:

        ```shell
        pdflatex.exe --synctex=1 --interaction=batchmode "summary_id.tex"
        bibtex "summary_id"
        pdflatex.exe --synctex=1 --interaction=batchmode "summary_id.tex"
        pdflatex.exe --synctex=1 --interaction=batchmode "summary_id.tex"
        ```

        ```shell
        pdflatex.exe --synctex=1 --interaction=batchmode "summary_en.tex"
        bibtex "summary_en"
        pdflatex.exe --synctex=1 --interaction=batchmode "summary_en.tex"
        pdflatex.exe --synctex=1 --interaction=batchmode "summary_en.tex"
        ```

        > **Note**
        >
        > Don't forget to create all necessarily chapters (e.g., `contents/chapter-1/chapter-1-sum-en`, `contents/chapter-2/chapter-2-sum-en`, `contents/chapter-1/chapter-1-sum-id`, and `contents/chapter-2/chapter-2-sum-id`).

## How-to-use

1. Read the detailed information in `thesis_template.tex`.

1. In case some `.sty` (packages) files are not available in your TeX installation, just copy the required one from the `packages/` directory into `main/` (side by side with `thesis_template.tex`). Hopefully, this will help beginner users.

1. In case the following `pgfplots` compatibility error occurs,

    ```plaintext
    ! Package pgfplots Error: Sorry, 'compat=1.16' is unknown in this context. Please use at most 'compat=1.15'.
    ```

    open the [`thesisdtetiugm.cls`](main/thesisdtetiugm.cls) file and edit `\pgfplotsset{compat=1.16}` to `\pgfplotsset{compat=1.15}`.  

1. In the case of an `Undefined control sequence.` error occurs in the `\UseRawInputEncoding` command of `thesisdtetiugm.cls`, open the [`thesisdtetiugm.cls`](main/thesisdtetiugm.cls) file and comment out `\UseRawInputEncoding` by adding a `%` before it.

    The `pgfplots` and `\UseRawInputEncoding` errors typically occur for Ubuntu/Linux users.

1. In the case of a page suddenly restarting from 0 due to the use of highlights, try to breakdowns the highlights. For cleaning highlights, use the `utilities/remove_highlight.ipynb`, It uses Python, so you might need to install Python first beforehand.

    > **Warning**
    >
    > The `utilities/remove_highlight.ipynb` and `utilities/remove_textit.ipynb` use regex and unable to count. Thus, it will fail to remove properly if there is nested curly bracket `{...{...}...}` inside. For example, `\hly{Hey \textit{italic} text}` will falsely removed to `\Hey \textit{italic text}`.

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

### Nomenclature

To build using `nomencl` (not yet fully supported), see [this tutorial](https://bytefreaks.net/applications/using-nomenclature-in-texstudio). Currently, only support manual nomenclature as shown in `main/contents/nomenclature/nomenclature.tex`.

### Images

Your images sit here.

### Additional files

```plaintext
|-- packages/ (Additional sty files for helping beginner users)
```

## Notes

1. Electronic Theses and Dissertations (ETD) [submission](https://unggah.etd.ugm.ac.id/) requires splitted files that can be copied. You can use [ilovepdf](https://www.ilovepdf.com/split_pdf#split,range). Printing using Microsoft Print to PDF will result in a rejected submission.

1. If you are going to send this repository to someone else, you can remove all artifacts using Git command:

    Check what will be deleted:

    ```shell
    git clean -dfXn
    ```

    Delete after you are sure about what are you doing

    ```shell
    git clean -dfXn
    ```

## License

MIT License
