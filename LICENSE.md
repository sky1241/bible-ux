# License

This repository uses a **dual license** structure:

| Part of the repo | License | Use |
|------------------|---------|-----|
| `prompts/**`, `DESIGN_TREE.md`, `VALUES.md`, `COMMANDES.txt`, `README*.md`, `CHANGELOG.md`, `ROADMAP.md`, `stats.json`, `.gitignore` | **MIT** (see below) | Free to use, fork, modify, redistribute. |
| `WEB.md`, `MOBILE.md`, `WEARABLE.md`, `XR.md`, `ICONS.md`, `_sources/**` | **Commercial EULA** (see below) | Personal use only. No redistribution. Paid licenses available. |

The bibles (`WEB.md`, `MOBILE.md`, `WEARABLE.md`, `XR.md`, `ICONS.md`) and the source PDFs are the commercial product. Everything else (prompts, workflow files, index) is free and meant to be copied.

---

## Part A — MIT License (prompts, index, meta files)

Copyright (c) 2026 sky1241

Permission is hereby granted, free of charge, to any person obtaining a copy
of the files listed in the table above as "MIT" (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

---

## Part B — Commercial EULA (UX bibles and sources)

**Scope.** This EULA covers `WEB.md`, `MOBILE.md`, `WEARABLE.md`, `XR.md`, `ICONS.md`, and the files under `_sources/`. It does **not** cover the files licensed under the MIT section above.

**Grant (personal license).** You are granted a non-exclusive, non-transferable, revocable license to:
- Read, reference, and consult the files on devices you own or control
- Use the rules contained within as input to your own design decisions and code
- Have your AI assistant (Claude, ChatGPT, Gemini, Copilot, etc.) read these files from a private copy to inform its answers

**Restrictions.** You may **not**, without a separate written commercial license:
- Redistribute the files in whole or in part, whether free or paid, in any format (markdown, PDF, website, app, SaaS feature, training dataset)
- Publish the files in a public repository, gist, paste service, or any internet-indexable location
- Incorporate substantial portions (more than 200 consecutive lines or 5% of any single file, whichever is smaller) into another published work, course, book, article, or product
- Use the files to train, fine-tune, or evaluate a machine learning model intended for third-party use
- Remove or obscure the copyright notices, attribution, or source citations
- Sell, sublicense, rent, lease, or lend access to the files

**Permitted quotations.** Short quotations for review, education, or criticism (up to 40 consecutive lines, with attribution) are allowed under fair use principles.

**Commercial licenses.** If you want to use this content in a commercial product, course, agency deliverable, training dataset, or public resource, a commercial license is available. Contact the author via the email in the repo metadata.

**Sources attribution.** The PDFs in `_sources/` reference third-party research (Google Material Design, Apple HIG, Samsung One UI, W3C, NN/g, Baymard, AppTweak, SplitMetrics, etc.). Those organizations retain their own rights; this EULA only covers the compilation and editorial work of this repository.

**Warranty.** The files are provided "AS IS" without warranty of any kind. The author is not liable for any damages arising from their use.

**Termination.** This EULA terminates automatically if you breach any of its terms. On termination, you must delete all copies of the covered files.

**Governing law.** French law.

---

## FAQ

**Can I use the UX rules in my client project?**
Yes — the grant lets you use the rules as input to your work. You just can't publish the files themselves.

**Can my AI assistant read these files?**
Yes, from a private copy on your machine. You cannot expose the files via a public API or training dataset.

**Can I fork this repo on GitHub?**
You can fork the MIT-licensed parts. Forking the whole repo publicly with the bibles intact violates Part B — fork privately, or fork only the MIT parts.

**Can I translate the bibles into my language?**
Translations are derivative works and require a commercial license.

**Can I copy the prompts into my project?**
Yes, unrestricted (MIT). That is the point.

**What counts as "redistribution"?**
Any act that makes the covered files available to a third party — public repo, download link, bundled product, training set, etc. Private use on your devices is not redistribution.

**Where do I request a commercial license?**
Open an issue on the GitHub repo or email the address listed in the repo metadata with the subject "bible-ux commercial license".

---

Copyright (c) 2026 sky1241. All rights reserved on the files covered by Part B.
