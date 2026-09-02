<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DataCollection.aspx.vb" Inherits="Research.DataCollection" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>PONV Prophylaxis Data Collection</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@500;700;800&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@500;600&display=swap" rel="stylesheet" />

    <style>
        :root {
            --primary: #0B4F6C;
            --primary-dark: #073A4F;
            --primary-light: #E9F2F5;
            --accent: #12877F;
            --accent-soft: #E3F4F2;
            --ink: #1B2A33;
            --muted: #64748B;
            --bg: #F3F6F8;
            --card: #FFFFFF;
            --border: #E1E8ED;
            --border-soft: #EDF2F5;
            --risk-low: #1D9A6C;
            --risk-mod: #C99A0A;
            --risk-high: #DB7C1F;
            --risk-vhigh: #D14343;
            --radius-lg: 16px;
            --radius-md: 10px;
            --radius-sm: 7px;
            --font-display: 'Manrope', sans-serif;
            --font-body: 'Inter', sans-serif;
            --font-mono: 'JetBrains Mono', monospace;
        }

        * { box-sizing: border-box; }

        html { scroll-behavior: smooth; }

        body {
            margin: 0;
            background: var(--bg);
            font-family: var(--font-body);
            color: var(--ink);
            -webkit-font-smoothing: antialiased;
        }

        /* ---------- Top progress bar ---------- */
        #scrollProgress {
            position: fixed;
            top: 0; left: 0;
            height: 3px;
            width: 0%;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            z-index: 999;
            transition: width .15s ease-out;
        }

        /* ---------- Header ---------- */
        .site-header {
            background: linear-gradient(135deg, var(--primary-dark), var(--primary) 65%);
            color: #fff;
            padding: 22px 28px;
            position: relative;
            overflow: hidden;
        }
        .site-header::after {
            content: "";
            position: absolute;
            right: -60px; top: -90px;
            width: 260px; height: 260px;
            border-radius: 50%;
            background: rgba(255,255,255,0.06);
        }
        .header-inner {
            max-width: 1180px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            position: relative;
            z-index: 1;
            flex-wrap: wrap;
        }
        .header-eyebrow {
            font-family: var(--font-mono);
            font-size: 11.5px;
            letter-spacing: .12em;
            text-transform: uppercase;
            color: rgba(255,255,255,0.72);
            margin: 0 0 6px;
        }
        .header-title {
            font-family: var(--font-display);
            font-weight: 800;
            font-size: 22px;
            line-height: 1.3;
            margin: 0;
            max-width: 640px;
        }
        .header-sub {
            font-size: 13px;
            color: rgba(255,255,255,0.78);
            margin: 8px 0 0;
        }
        .header-meta {
            display: flex;
            flex-direction: column;
            gap: 10px;
            align-items: flex-end;
        }
        .form-code {
            font-family: var(--font-mono);
            font-size: 12px;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.22);
            padding: 5px 12px;
            border-radius: 999px;
            color: #fff;
        }
        .patient-chip {
            display: flex;
            align-items: center;
            gap: 8px;
            background: #fff;
            color: var(--primary-dark);
            font-family: var(--font-mono);
            font-size: 13px;
            font-weight: 600;
            padding: 7px 14px 7px 10px;
            border-radius: 999px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.18);
        }
        .patient-chip .dot {
            width: 8px; height: 8px;
            border-radius: 50%;
            background: var(--accent);
            flex-shrink: 0;
        }
        .patient-chip.empty { color: var(--muted); }
        .patient-chip.empty .dot { background: #C7D1D8; }

        /* ---------- Layout ---------- */
        .page-shell {
            max-width: 1180px;
            margin: 0 auto;
            padding: 28px 28px 80px;
            display: grid;
            grid-template-columns: 220px 1fr;
            gap: 28px;
            align-items: start;
        }

        /* ---------- Section nav rail ---------- */
        .rail {
            position: sticky;
            top: 22px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 10px;
            display: flex;
            flex-direction: column;
            gap: 2px;
        }
        .rail-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 12px;
            border-radius: var(--radius-md);
            text-decoration: none;
            color: var(--muted);
            font-size: 13px;
            font-weight: 600;
            transition: background .15s, color .15s;
            cursor: pointer;
        }
        .rail-item svg { width: 16px; height: 16px; flex-shrink: 0; }
        .rail-item .letter {
            width: 20px; height: 20px;
            border-radius: 6px;
            background: var(--border-soft);
            color: var(--muted);
            font-family: var(--font-mono);
            font-size: 11px;
            font-weight: 700;
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
        }
        .rail-item:hover { background: var(--primary-light); color: var(--primary-dark); }
        .rail-item.active { background: var(--primary-light); color: var(--primary-dark); }
        .rail-item.active .letter { background: var(--primary); color: #fff; }

        /* ---------- Main column ---------- */
        .main-col { display: flex; flex-direction: column; gap: 20px; min-width: 0; }

        .section-card {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 26px 28px 28px;
            scroll-margin-top: 20px;
        }

        .section-head {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            margin-bottom: 22px;
            padding-bottom: 16px;
            border-bottom: 1px solid var(--border-soft);
        }
        .section-badge {
            width: 38px; height: 38px;
            border-radius: 10px;
            background: var(--primary-light);
            color: var(--primary-dark);
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
        }
        .section-badge svg { width: 19px; height: 19px; }
        .section-titles h2 {
            font-family: var(--font-display);
            font-size: 16px;
            font-weight: 800;
            margin: 0;
            color: var(--ink);
        }
        .section-titles p {
            margin: 3px 0 0;
            font-size: 12px;
            color: var(--muted);
            font-style: italic;
        }

        .field-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px 18px;
        }
        .field-grid.cols-2 { grid-template-columns: repeat(2, 1fr); }
        .field { display: flex; flex-direction: column; gap: 6px; }
        .field.span-2 { grid-column: span 2; }
        .field.span-3 { grid-column: span 3; }

        label.field-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--ink);
            letter-spacing: .01em;
        }
        .field-label .opt { font-weight: 400; color: var(--muted); font-style: italic; }

        input.form-control, .form-control {
            width: 100%;
            padding: 10px 12px;
            border: 1.5px solid var(--border);
            border-radius: var(--radius-sm);
            font-family: var(--font-body);
            font-size: 13.5px;
            color: var(--ink);
            background: #fff;
            transition: border-color .15s, box-shadow .15s;
        }
        input.form-control:focus, .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px var(--primary-light);
        }
        input.form-control:disabled {
            background: var(--border-soft);
            color: var(--muted);
            cursor: not-allowed;
        }
        input.mono { font-family: var(--font-mono); }

        .divider-row {
            grid-column: 1 / -1;
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 2px 0;
        }

        /* ---------- Segmented toggle (radio) ---------- */
        .segmented {
            display: inline-flex;
            border: 1.5px solid var(--border);
            border-radius: 999px;
            padding: 3px;
            gap: 2px;
            width: fit-content;
        }
        .segmented input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 1px; height: 1px;
        }
        .segmented label {
            padding: 7px 18px;
            font-size: 13px;
            font-weight: 600;
            color: var(--muted);
            border-radius: 999px;
            cursor: pointer;
            transition: background .15s, color .15s;
        }
        .segmented input[type="radio"]:checked + label {
            background: var(--primary);
            color: #fff;
        }
        .segmented input[type="radio"]:focus-visible + label {
            box-shadow: 0 0 0 3px var(--primary-light);
        }

        /* ---------- small inline yes/no (used inside tables) ---------- */
        .mini-toggle {
            display: inline-flex;
            border: 1.5px solid var(--border);
            border-radius: 999px;
            padding: 2px;
            gap: 2px;
            width: fit-content;
        }
        .mini-toggle input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 1px; height: 1px;
        }
        .mini-toggle label {
            padding: 5px 12px;
            font-size: 12px;
            font-weight: 600;
            color: var(--muted);
            border-radius: 999px;
            cursor: pointer;
        }
        .mini-toggle input[type="radio"]:checked + label {
            background: var(--primary);
            color: #fff;
        }

        /* ---------- Chip checkboxes ---------- */
        .chip-group { display: flex; flex-wrap: wrap; gap: 10px; }
        .chip-group input[type="checkbox"] {
            position: absolute;
            opacity: 0;
            width: 1px; height: 1px;
        }
        .chip-group label {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 9px 15px;
            border: 1.5px solid var(--border);
            border-radius: var(--radius-md);
            font-size: 13px;
            font-weight: 500;
            color: var(--ink);
            cursor: pointer;
            background: #fff;
            transition: border-color .15s, background .15s;
        }
        .chip-group label::before {
            content: "";
            width: 15px; height: 15px;
            border-radius: 4px;
            border: 1.5px solid #C7D1D8;
            background: #fff;
            flex-shrink: 0;
            transition: background .15s, border-color .15s;
        }
        .chip-group input[type="checkbox"]:checked + label {
            border-color: var(--accent);
            background: var(--accent-soft);
            color: var(--primary-dark);
        }
        .chip-group input[type="checkbox"]:checked + label::before {
            background: var(--accent) url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='none' stroke='white' stroke-width='2.4'%3E%3Cpath d='M3 8.5l3 3 7-7'/%3E%3C/svg%3E") center/10px no-repeat;
            border-color: var(--accent);
        }
        .chip-group input[type="checkbox"]:focus-visible + label {
            box-shadow: 0 0 0 3px var(--primary-light);
        }

        /* ---------- Apfel risk panel (signature element) ---------- */
        .apfel-panel {
            display: grid;
            grid-template-columns: 200px 1fr;
            gap: 24px;
            align-items: center;
            background: var(--primary-light);
            border: 1px solid #D7E7EC;
            border-radius: var(--radius-md);
            padding: 18px 22px;
            margin-bottom: 22px;
        }
        .apfel-score-display { text-align: center; }
        .apfel-score-display .score-num {
            font-family: var(--font-mono);
            font-size: 42px;
            font-weight: 700;
            color: var(--primary-dark);
            line-height: 1;
        }
        .apfel-score-display .score-label {
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: .08em;
            color: var(--muted);
            margin-top: 4px;
        }
        .risk-badge {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 5px 13px;
            border-radius: 999px;
            font-size: 12.5px;
            font-weight: 700;
            margin-top: 8px;
        }
        .risk-badge .dot { width: 7px; height: 7px; border-radius: 50%; }
        .risk-note { font-size: 12.5px; color: var(--muted); margin: 6px 0 0; line-height: 1.5; }
        .risk-note strong { color: var(--ink); }

        /* ---------- Sub label for grouped fields ---------- */
        .group-label {
            font-size: 12px;
            font-weight: 700;
            color: var(--primary-dark);
            text-transform: uppercase;
            letter-spacing: .04em;
            margin: 4px 0 2px;
        }

        /* ---------- Roman-numeral subsection headers (Section D) ---------- */
        .subsection {
            border-top: 1px dashed var(--border-soft);
            padding-top: 18px;
            margin-top: 18px;
        }
        .subsection:first-of-type { border-top: none; padding-top: 0; margin-top: 0; }
        .subsection-label {
            display: flex;
            align-items: center;
            gap: 9px;
            font-family: var(--font-display);
            font-weight: 800;
            font-size: 13.5px;
            color: var(--primary-dark);
            margin: 0 0 14px;
        }
        .subsection-label .num {
            width: 23px; height: 23px;
            border-radius: 7px;
            background: var(--primary);
            color: #fff;
            display: flex; align-items: center; justify-content: center;
            font-family: var(--font-mono);
            font-size: 10.5px;
            font-weight: 700;
            flex-shrink: 0;
        }

        .inline-specify { margin-top: 10px; max-width: 440px; }

        .antiemetic-row {
            display: grid;
            grid-template-columns: auto 130px;
            gap: 14px;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px dashed var(--border-soft);
        }
        .antiemetic-row:last-child { border-bottom: none; }
        .antiemetic-row .chk-line {
            display: flex; align-items: center; gap: 10px;
        }
        .antiemetic-row .chk-line input[type="checkbox"] {
            position: absolute; opacity: 0; width: 1px; height: 1px;
        }
        .antiemetic-row .chk-line label.drug-label {
            display: flex; align-items: center; gap: 9px;
            font-size: 13.5px; font-weight: 600; color: var(--ink);
            cursor: pointer;
        }
        .antiemetic-row .chk-line label.drug-label::before {
            content: "";
            width: 16px; height: 16px;
            border-radius: 4px;
            border: 1.5px solid #C7D1D8;
            flex-shrink: 0;
        }
        .antiemetic-row .chk-line input[type="checkbox"]:checked + label.drug-label::before {
            background: var(--accent) url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='none' stroke='white' stroke-width='2.4'%3E%3Cpath d='M3 8.5l3 3 7-7'/%3E%3C/svg%3E") center/10px no-repeat;
            border-color: var(--accent);
        }

        /* ---------- Data tables (Section E timing grid, Section F outcomes) ---------- */
        .table-wrap { overflow-x: auto; margin-top: 4px; }
        table.data-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
            min-width: 640px;
        }
        table.data-table th, table.data-table td {
            border: 1px solid var(--border);
            padding: 11px 13px;
            text-align: left;
            vertical-align: middle;
        }
        table.data-table thead th {
            background: var(--primary-light);
            color: var(--primary-dark);
            font-family: var(--font-display);
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: .05em;
            font-weight: 800;
        }
        table.data-table th.row-head, table.data-table td.row-head {
            font-weight: 700;
            color: var(--ink);
            background: var(--border-soft);
            white-space: nowrap;
        }
        table.data-table td.center, table.data-table th.center { text-align: center; }
        table.data-table td.sub-row { background: #FAFCFD; font-style: italic; color: var(--muted); font-size: 12.5px; }
        table.data-table input.form-control { padding: 7px 9px; font-size: 12.5px; min-width: 90px; }

        .given-check {
            display: flex; align-items: center; gap: 8px;
            font-size: 13px; font-weight: 600;
        }
        .given-check input[type="checkbox"] {
            width: 16px; height: 16px; accent-color: var(--accent); cursor: pointer;
        }

        .timing-cell { display: flex; flex-direction: column; gap: 7px; }
        .timing-cell label {
            display: flex; align-items: center; gap: 7px;
            font-size: 12px; font-weight: 500; color: var(--ink); cursor: pointer;
        }
        .timing-cell input[type="checkbox"] {
            width: 14px; height: 14px; accent-color: var(--primary); cursor: pointer;
        }

        /* ---------- Outcome mini cards ---------- */
        .outcome-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
        .outcome-item {
            border: 1.5px solid var(--border);
            border-radius: var(--radius-md);
            padding: 16px 18px;
        }
        .outcome-item .field-label { display: block; margin-bottom: 10px; }

        /* ---------- Submit bar ---------- */
        .submit-bar {
            position: sticky;
            bottom: 18px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius-lg);
            padding: 14px 18px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 14px;
            box-shadow: 0 12px 30px rgba(11,79,108,0.14);
        }
        .submit-bar .hint { font-size: 12.5px; color: var(--muted); }
        .btn-submit {
            background: var(--primary);
            color: #fff;
            border: none;
            padding: 12px 28px;
            border-radius: var(--radius-md);
            font-family: var(--font-body);
            font-weight: 700;
            font-size: 14px;
            cursor: pointer;
            transition: background .15s, transform .1s;
        }
        .btn-submit:hover { background: var(--primary-dark); }
        .btn-submit:active { transform: translateY(1px); }

        @media (max-width: 900px) {
            .page-shell { grid-template-columns: 1fr; padding: 18px 16px 70px; }
            .rail {
                position: static;
                flex-direction: row;
                overflow-x: auto;
                gap: 4px;
            }
            .rail-item { flex-shrink: 0; }
            .field-grid, .field-grid.cols-2 { grid-template-columns: 1fr; }
            .field.span-2, .field.span-3 { grid-column: span 1; }
            .apfel-panel { grid-template-columns: 1fr; text-align: center; }
            .outcome-grid { grid-template-columns: 1fr; }
            .header-meta { align-items: flex-start; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div id="scrollProgress"></div>

    <div class="site-header">
        <div class="header-inner">
            <div>
                <p class="header-eyebrow">Department of Anaesthesiology &middot; Clinical Research</p>
                <h1 class="header-title">Adherence to Guideline-Recommended Prophylaxis for PONV</h1>
                <p class="header-sub">Single centre, prospective cohort study &mdash; adult surgical patients</p>
            </div>
            <div class="header-meta">
                <span class="form-code">FORM&nbsp;NO.&nbsp;PONV-DC</span>
                <span class="patient-chip empty" id="patientChip">
                    <span class="dot"></span>
                    <span id="patientChipText">No patient ID entered</span>
                </span>
            </div>
        </div>
    </div>

    <div class="page-shell">

        <!-- ===== Section nav rail ===== -->
        <nav class="rail" id="sectionRail">
            <a class="rail-item" data-target="secA"><span class="letter">A</span> Demographics</a>
            <a class="rail-item" data-target="secB"><span class="letter">B</span> Surgery</a>
            <a class="rail-item" data-target="secC"><span class="letter">C</span> Apfel Score</a>
            <a class="rail-item" data-target="secD"><span class="letter">D</span> Mitigation</a>
            <a class="rail-item" data-target="secE"><span class="letter">E</span> Antiemetics</a>
            <a class="rail-item" data-target="secF"><span class="letter">F</span> Outcomes</a>
        </nav>

        <div class="main-col">

            <!-- ===== A. DEMOGRAPHICS ===== -->
            <div class="section-card" id="secA">
                <div class="section-head">
                    <div class="section-badge">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><circle cx="12" cy="8" r="3.4"/><path d="M4.5 20c1.5-4 4.2-6 7.5-6s6 2 7.5 6"/></svg>
                    </div>
                    <div class="section-titles">
                        <h2>A. Patient Demographics</h2>
                        <p>Source: Pre-operative assessment record</p>
                    </div>
                </div>

                <div class="field-grid">
                    <div class="field">
                        <label class="field-label" for="txtPatientID">Patient ID</label>
                        <asp:TextBox ID="txtPatientID" runat="server" CssClass="form-control mono" placeholder="e.g. PONV-0142" />
                    </div>
                    <div class="field">
                        <label class="field-label" for="txtAge">Age (years)</label>
                        <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="0" />
                    </div>
                    <div class="field">
                        <label class="field-label" for="txtWeight">Weight (kg)</label>
                        <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" placeholder="0.0" />
                    </div>

                    <div class="field span-2">
                        <label class="field-label">Sex</label>
                        <div class="segmented">
                            <asp:RadioButton ID="rbMale" GroupName="sex" runat="server" Text="Male" />
                            <asp:RadioButton ID="rbFemale" GroupName="sex" runat="server" Text="Female" />
                        </div>
                    </div>

                    <div class="field span-3">
                        <label class="field-label">ASA Physical Status</label>
                        <div class="segmented">
                            <asp:RadioButton ID="asa1" GroupName="asa" runat="server" Text="I" />
                            <asp:RadioButton ID="asa2" GroupName="asa" runat="server" Text="II" />
                            <asp:RadioButton ID="asa3" GroupName="asa" runat="server" Text="III" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- ===== B. SURGICAL DETAILS ===== -->
            <div class="section-card" id="secB">
                <div class="section-head">
                    <div class="section-badge">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M4 20L14 10"/><circle cx="17" cy="7" r="2.6"/><path d="M9.5 14.5l3 3"/></svg>
                    </div>
                    <div class="section-titles">
                        <h2>B. Surgical Details</h2>
                        <p>Source: Anaesthesia record form</p>
                    </div>
                </div>

                <div class="field-grid">
                    <div class="field">
                        <label class="field-label" for="txtDate">Date of Surgery</label>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="field">
                        <label class="field-label" for="txtDuration">Duration (minutes)</label>
                        <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" placeholder="0" />
                    </div>
                    <div class="field">
                        <label class="field-label" for="txtDiscipline">Surgical Discipline</label>
                        <asp:TextBox ID="txtDiscipline" runat="server" CssClass="form-control" placeholder="e.g. General Surgery" />
                    </div>

                    <div class="field span-3">
                        <label class="field-label">Laparoscopic Surgery</label>
                        <div class="segmented">
                            <asp:RadioButton ID="lapYes" GroupName="lap" runat="server" Text="Yes" />
                            <asp:RadioButton ID="lapNo" GroupName="lap" runat="server" Text="No" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- ===== C. APFEL SCORE ===== -->
            <div class="section-card" id="secC">
                <div class="section-head">
                    <div class="section-badge">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="4.5" y="3.5" width="15" height="17" rx="2"/><path d="M8 8h8M8 12h2.5M13.5 12h2.5M8 16h2.5M13.5 16h2.5"/></svg>
                    </div>
                    <div class="section-titles">
                        <h2>C. Apfel Simplified Risk Score</h2>
                        <p>Auto-calculated from the four risk factors below</p>
                    </div>
                </div>

                <div class="field span-3" style="margin-bottom: 18px;">
                    <label class="field-label">Apfel score calculated / documented by clinician</label>
                    <div class="segmented">
                        <asp:RadioButton ID="apfelDocYes" GroupName="apfelDoc" runat="server" Text="Yes" />
                        <asp:RadioButton ID="apfelDocNo" GroupName="apfelDoc" runat="server" Text="No" />
                    </div>
                </div>

                <div class="apfel-panel">
                    <div class="apfel-score-display">
                        <div class="score-num" id="apfelScoreNum">0</div>
                        <div class="score-label">of 4 factors</div>
                        <div class="risk-badge" id="apfelRiskBadge" style="background:#E4EEF0; color:var(--muted);">
                            <span class="dot" style="background:#B7C3CB;"></span>
                            <span id="apfelRiskText">Awaiting entry</span>
                        </div>
                    </div>
                    <div>
                        <p class="risk-note" id="apfelRiskNote">
                            <strong>Estimated PONV risk: &mdash;</strong><br />
                            Tick the risk factors that apply to this patient. The score and estimated 24-hour PONV risk update automatically and mirror into the Total Apfel Score field below.
                        </p>
                    </div>
                </div>

                <div class="field span-2" style="max-width: 220px; margin-bottom: 18px;">
                    <label class="field-label" for="txtApfel">Total Apfel Score (0&ndash;4)</label>
                    <asp:TextBox ID="txtApfel" runat="server" CssClass="form-control mono" placeholder="0" ReadOnly="true" />
                </div>

                <div class="group-label">Risk Factors</div>
                <div class="chip-group">
                    <asp:CheckBox ID="chkFemale" runat="server" Text="Female gender" />
                    <asp:CheckBox ID="chkNonSmoker" runat="server" Text="Non-smoker" />
                    <asp:CheckBox ID="chkHistory" runat="server" Text="History of PONV / motion sickness" />
                    <asp:CheckBox ID="chkOpioid" runat="server" Text="Postoperative opioid use" />
                </div>
            </div>

            <!-- ===== D. RISK MITIGATION ===== -->
            <div class="section-card" id="secD">
                <div class="section-head">
                    <div class="section-badge">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 3l7 3v6c0 4.5-3 7.5-7 9-4-1.5-7-4.5-7-9V6l7-3z"/></svg>
                    </div>
                    <div class="section-titles">
                        <h2>D. Risk Mitigation Strategies</h2>
                        <p>Anaesthetic technique, analgesia &amp; intraoperative fluid management</p>
                    </div>
                </div>

                <!-- i. Anaesthetic technique -->
                <div class="subsection">
                    <div class="subsection-label"><span class="num">i</span> Anaesthetic Technique</div>

                    <div class="group-label">Maintenance of Anaesthesia</div>
                    <div class="segmented" style="margin-bottom: 20px;">
                        <asp:RadioButton ID="vol" GroupName="anaes" runat="server" Text="Volatile" />
                        <asp:RadioButton ID="tiva" GroupName="anaes" runat="server" Text="TIVA" />
                    </div>

                    <div class="group-label">Nitrous Oxide Used</div>
                    <div class="segmented">
                        <asp:RadioButton ID="n2oYes" GroupName="n2o" runat="server" Text="Yes" />
                        <asp:RadioButton ID="n2oNo" GroupName="n2o" runat="server" Text="No" />
                    </div>
                </div>

                <!-- ii. Analgesia -->
                <div class="subsection">
                    <div class="subsection-label"><span class="num">ii</span> Analgesia</div>

                    <div class="group-label">Intraoperative Opioid Used</div>
                    <div class="segmented" style="margin-bottom: 12px;">
                        <asp:RadioButton ID="opioidYes" GroupName="opioid" runat="server" Text="Yes" />
                        <asp:RadioButton ID="opioidNo" GroupName="opioid" runat="server" Text="No" />
                    </div>
                    <div class="field" style="max-width: 420px; margin-bottom: 20px;">
                        <label class="field-label" for="txtOpioidDetail">Type &amp; total dose <span class="opt">(if yes)</span></label>
                        <asp:TextBox ID="txtOpioidDetail" runat="server" CssClass="form-control" placeholder="e.g. Fentanyl 250mcg" />
                    </div>

                    <div class="group-label">Opioid Sparing Strategies</div>
                    <div class="chip-group">
                        <asp:CheckBox ID="chkPara" runat="server" Text="Paracetamol" />
                        <asp:CheckBox ID="chkNSAID" runat="server" Text="NSAID / COX-2 inhibitor" />
                        <asp:CheckBox ID="chkRegional" runat="server" Text="Regional / neuraxial technique" />
                        <asp:CheckBox ID="chkKetamine" runat="server" Text="Ketamine" />
                        <asp:CheckBox ID="chkMagnesium" runat="server" Text="Magnesium sulphate" />
                        <asp:CheckBox ID="chkDexmed" runat="server" Text="Dexmedetomidine" />
                    </div>
                    <div class="field inline-specify">
                        <label class="field-label" for="txtRegionalDetail">Regional / neuraxial technique &mdash; specify <span class="opt">(if selected)</span></label>
                        <asp:TextBox ID="txtRegionalDetail" runat="server" CssClass="form-control" placeholder="e.g. TAP block, spinal anaesthesia" />
                    </div>

                    <div class="field" style="max-width: 260px; margin-top: 20px;">
                        <label class="field-label" for="txtMME">Calculated intraoperative opioid dose &mdash; Total IV MME (mg/kg)</label>
                        <asp:TextBox ID="txtMME" runat="server" CssClass="form-control mono" placeholder="0.00" />
                    </div>
                </div>

                <!-- iii. Goal-directed hydration -->
                <div class="subsection">
                    <div class="subsection-label"><span class="num">iii</span> Goal-Directed Hydration</div>

                    <div class="field-grid cols-2">
                        <div class="field">
                            <label class="field-label" for="txtFluidAmount">Total Fluid Amount (ml)</label>
                            <asp:TextBox ID="txtFluidAmount" runat="server" CssClass="form-control" placeholder="0" />
                        </div>
                        <div class="field">
                            <label class="field-label">Adequate Hydration</label>
                            <div class="segmented">
                                <asp:RadioButton ID="hydrationYes" GroupName="hydration" runat="server" Text="Yes" />
                                <asp:RadioButton ID="hydrationNo" GroupName="hydration" runat="server" Text="No" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ===== E. ANTIEMETIC ===== -->
            <div class="section-card" id="secE">
                <div class="section-head">
                    <div class="section-badge">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M10 3h4M12 3v6M8 9h8l1.5 10.5a2 2 0 01-2 2.5h-7a2 2 0 01-2-2.5L8 9z"/><path d="M9.3 14h5.4"/></svg>
                    </div>
                    <div class="section-titles">
                        <h2>E. Antiemetic Administration</h2>
                        <p>Agent, dose and administration timing</p>
                    </div>
                </div>

                <div class="field span-3" style="margin-bottom: 20px;">
                    <label class="field-label">Antiemetic Given</label>
                    <div class="segmented">
                        <asp:RadioButton ID="antiemeticYes" GroupName="antiemeticGiven" runat="server" Text="Yes" />
                        <asp:RadioButton ID="antiemeticNo" GroupName="antiemeticGiven" runat="server" Text="No" />
                    </div>
                </div>

                <div class="group-label">Timing of Antiemetic Administration</div>
                <div class="table-wrap">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Drug</th>
                                <th class="center">Given</th>
                                <th class="center">Dose</th>
                                <th class="center">At Induction</th>
                                <th class="center">Intra-operative</th>
                                <th class="center">End of Surgery</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="row-head">Dexamethasone</td>
                                <td class="center"><div class="given-check"><asp:CheckBox ID="chkDexa" runat="server" /></div></td>
                                <td><asp:TextBox ID="txtDexaDose" runat="server" CssClass="form-control" placeholder="mg" /></td>
                                <td class="center"><asp:CheckBox ID="chkDexaInduction" runat="server" /></td>
                                <td class="center"><asp:CheckBox ID="chkDexaIntraop" runat="server" /></td>
                                <td class="center"><asp:CheckBox ID="chkDexaEnd" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="row-head">Ondansetron</td>
                                <td class="center"><div class="given-check"><asp:CheckBox ID="chkOndan" runat="server" /></div></td>
                                <td><asp:TextBox ID="txtOndanDose" runat="server" CssClass="form-control" placeholder="mg" /></td>
                                <td class="center"><asp:CheckBox ID="chkOndanInduction" runat="server" /></td>
                                <td class="center"><asp:CheckBox ID="chkOndanIntraop" runat="server" /></td>
                                <td class="center"><asp:CheckBox ID="chkOndanEnd" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="row-head">Metoclopramide</td>
                                <td class="center"><div class="given-check"><asp:CheckBox ID="chkMetro" runat="server" /></div></td>
                                <td><asp:TextBox ID="txtMetroDose" runat="server" CssClass="form-control" placeholder="mg" /></td>
                                <td class="center"><asp:CheckBox ID="chkMetroInduction" runat="server" /></td>
                                <td class="center"><asp:CheckBox ID="chkMetroIntraop" runat="server" /></td>
                                <td class="center"><asp:CheckBox ID="chkMetroEnd" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="row-head">Others (specify)</td>
                                <td class="center"><div class="given-check"><asp:CheckBox ID="chkOthers" runat="server" /></div></td>
                                <td><asp:TextBox ID="txtOthersDose" runat="server" CssClass="form-control" placeholder="mg" /></td>
                                <td class="center"><asp:CheckBox ID="chkOthersInduction" runat="server" /></td>
                                <td class="center"><asp:CheckBox ID="chkOthersIntraop" runat="server" /></td>
                                <td class="center"><asp:CheckBox ID="chkOthersEnd" runat="server" /></td>
                            </tr>
                            <tr>
                                <td class="row-head sub-row">Drug name, if "Others"</td>
                                <td class="sub-row" colspan="5">
                                    <asp:TextBox ID="txtOthersName" runat="server" CssClass="form-control" placeholder="Specify drug name" style="max-width:360px;" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- ===== F. OUTCOMES ===== -->
            <div class="section-card" id="secF">
                <div class="section-head">
                    <div class="section-badge">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M4 19V9M10 19V5M16 19v-7M4 19h16"/></svg>
                    </div>
                    <div class="section-titles">
                        <h2>F. Postoperative Outcomes</h2>
                        <p>Source: Recovery / ward observation chart</p>
                    </div>
                </div>

                <div class="table-wrap">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Clinical Parameter</th>
                                <th class="center">Early PONV (T1)<br /><span style="font-weight:500; text-transform:none; letter-spacing:0;">0&ndash;6 hrs postop</span></th>
                                <th class="center">Late PONV (T2)<br /><span style="font-weight:500; text-transform:none; letter-spacing:0;">6&ndash;24 hrs postop</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="row-head">1. Nausea</td>
                                <td class="center">
                                    <div class="mini-toggle">
                                        <asp:RadioButton ID="nauseaT1Yes" GroupName="nauseaT1" runat="server" Text="Yes" />
                                        <asp:RadioButton ID="nauseaT1No" GroupName="nauseaT1" runat="server" Text="No" />
                                    </div>
                                </td>
                                <td class="center">
                                    <div class="mini-toggle">
                                        <asp:RadioButton ID="nauseaT2Yes" GroupName="nauseaT2" runat="server" Text="Yes" />
                                        <asp:RadioButton ID="nauseaT2No" GroupName="nauseaT2" runat="server" Text="No" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="row-head">2. Vomiting</td>
                                <td class="center">
                                    <div class="mini-toggle">
                                        <asp:RadioButton ID="vomitT1Yes" GroupName="vomitT1" runat="server" Text="Yes" />
                                        <asp:RadioButton ID="vomitT1No" GroupName="vomitT1" runat="server" Text="No" />
                                    </div>
                                </td>
                                <td class="center">
                                    <div class="mini-toggle">
                                        <asp:RadioButton ID="vomitT2Yes" GroupName="vomitT2" runat="server" Text="Yes" />
                                        <asp:RadioButton ID="vomitT2No" GroupName="vomitT2" runat="server" Text="No" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="row-head">3. Both nausea &amp; vomiting</td>
                                <td class="center">
                                    <div class="mini-toggle">
                                        <asp:RadioButton ID="bothT1Yes" GroupName="bothT1" runat="server" Text="Yes" />
                                        <asp:RadioButton ID="bothT1No" GroupName="bothT1" runat="server" Text="No" />
                                    </div>
                                </td>
                                <td class="center">
                                    <div class="mini-toggle">
                                        <asp:RadioButton ID="bothT2Yes" GroupName="bothT2" runat="server" Text="Yes" />
                                        <asp:RadioButton ID="bothT2No" GroupName="bothT2" runat="server" Text="No" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="row-head sub-row">If yes, number of episodes</td>
                                <td class="sub-row"><asp:TextBox ID="txtEpisodesT1" runat="server" CssClass="form-control" placeholder="0" /></td>
                                <td class="sub-row"><asp:TextBox ID="txtEpisodesT2" runat="server" CssClass="form-control" placeholder="0" /></td>
                            </tr>
                            <tr>
                                <td class="row-head">4. Need for rescue antiemetic</td>
                                <td class="center">
                                    <div class="mini-toggle">
                                        <asp:RadioButton ID="rescueT1No" GroupName="rescueT1" runat="server" Text="0 = No" />
                                        <asp:RadioButton ID="rescueT1Yes" GroupName="rescueT1" runat="server" Text="1 = Yes" />
                                    </div>
                                </td>
                                <td class="center">
                                    <div class="mini-toggle">
                                        <asp:RadioButton ID="rescueT2No" GroupName="rescueT2" runat="server" Text="0 = No" />
                                        <asp:RadioButton ID="rescueT2Yes" GroupName="rescueT2" runat="server" Text="1 = Yes" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="row-head sub-row">If yes, name of drug(s) given</td>
                                <td class="sub-row"><asp:TextBox ID="txtRescueDrugT1" runat="server" CssClass="form-control" placeholder="Drug name(s)" /></td>
                                <td class="sub-row"><asp:TextBox ID="txtRescueDrugT2" runat="server" CssClass="form-control" placeholder="Drug name(s)" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- ===== SUBMIT ===== -->
            <div class="submit-bar">
                <span class="hint">Review all six sections before submitting.</span>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Record" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>

        </div>
    </div>

</form>

<script>
    (function () {
        // ---------- Patient ID chip sync ----------
        var patientInput = document.getElementById('<%= txtPatientID.ClientID %>');
        var chip = document.getElementById('patientChip');
        var chipText = document.getElementById('patientChipText');

        function syncPatientChip() {
            var val = patientInput ? patientInput.value.trim() : '';
            if (val.length > 0) {
                chip.classList.remove('empty');
                chipText.textContent = 'Patient ' + val;
            } else {
                chip.classList.add('empty');
                chipText.textContent = 'No patient ID entered';
            }
        }
        if (patientInput) {
            patientInput.addEventListener('input', syncPatientChip);
            syncPatientChip();
        }

        // ---------- Apfel score auto-calculation ----------
        var apfelIds = ['<%= chkFemale.ClientID %>', '<%= chkNonSmoker.ClientID %>', '<%= chkHistory.ClientID %>', '<%= chkOpioid.ClientID %>'];
        var apfelInputs = apfelIds.map(function (id) { return document.getElementById(id); });
        var apfelScoreEl = document.getElementById('<%= txtApfel.ClientID %>');
        var scoreNum = document.getElementById('apfelScoreNum');
        var riskBadge = document.getElementById('apfelRiskBadge');
        var riskDot = riskBadge ? riskBadge.querySelector('.dot') : null;
        var riskText = document.getElementById('apfelRiskText');
        var riskNote = document.getElementById('apfelRiskNote');

        var riskTiers = [
            { pct: '~10%', label: 'Low risk', color: '#1D9A6C', bg: '#E6F6EE', advice: 'Routine care; prophylaxis not usually required.' },
            { pct: '~20%', label: 'Low-moderate risk', color: '#1D9A6C', bg: '#E6F6EE', advice: 'Consider a single prophylactic agent.' },
            { pct: '~40%', label: 'Moderate risk', color: '#C99A0A', bg: '#FBF3DC', advice: '1&ndash;2 prophylactic interventions recommended.' },
            { pct: '~60%', label: 'High risk', color: '#DB7C1F', bg: '#FCEBDA', advice: '2 or more prophylactic interventions recommended.' },
            { pct: '~80%', label: 'Very high risk', color: '#D14343', bg: '#FBE4E4', advice: 'Multimodal strategy (3+ interventions) strongly recommended.' }
        ];

        function recalcApfel() {
            var count = apfelInputs.reduce(function (sum, el) { return sum + (el && el.checked ? 1 : 0); }, 0);
            if (apfelScoreEl) apfelScoreEl.value = count;
            if (scoreNum) scoreNum.textContent = count;

            var tier = riskTiers[count] || riskTiers[0];
            if (riskBadge) riskBadge.style.background = tier.bg;
            if (riskDot) riskDot.style.background = tier.color;
            if (riskText) { riskText.style.color = tier.color; riskText.textContent = tier.label; }
            if (riskBadge) riskBadge.querySelector('span:last-child').style.color = tier.color;
            if (riskNote) {
                riskNote.innerHTML = '<strong>Estimated 24-hour PONV risk: ' + tier.pct + '</strong><br />' + tier.advice;
            }
        }
        apfelInputs.forEach(function (el) { if (el) el.addEventListener('change', recalcApfel); });
        recalcApfel();

        // ---------- Conditional field enabling: Yes/No radio pair -> single text field ----------
        function bindToggle(radioYesId, radioNoId, targetId) {
            var yesEl = document.getElementById(radioYesId);
            var noEl = document.getElementById(radioNoId);
            var target = document.getElementById(targetId);
            if (!yesEl || !noEl || !target) return;
            function update() {
                var enabled = yesEl.checked;
                target.disabled = !enabled;
                if (!enabled) target.value = '';
            }
            yesEl.addEventListener('change', update);
            noEl.addEventListener('change', update);
            update();
        }
        bindToggle('<%= opioidYes.ClientID %>', '<%= opioidNo.ClientID %>', '<%= txtOpioidDetail.ClientID %>');

        // ---------- Conditional field enabling: single checkbox -> dependent field(s) ----------
        function bindCheckToggle(checkId, targetIds) {
            var chk = document.getElementById(checkId);
            var targets = targetIds.map(function (id) { return document.getElementById(id); }).filter(Boolean);
            if (!chk || targets.length === 0) return;
            function update() {
                targets.forEach(function (t) {
                    t.disabled = !chk.checked;
                    if (!chk.checked) t.value = '';
                });
            }
            chk.addEventListener('change', update);
            update();
        }
        bindCheckToggle('<%= chkDexa.ClientID %>', ['<%= txtDexaDose.ClientID %>']);
        bindCheckToggle('<%= chkOndan.ClientID %>', ['<%= txtOndanDose.ClientID %>']);
        bindCheckToggle('<%= chkMetro.ClientID %>', ['<%= txtMetroDose.ClientID %>']);
        bindCheckToggle('<%= chkOthers.ClientID %>', ['<%= txtOthersDose.ClientID %>', '<%= txtOthersName.ClientID %>']);
        bindCheckToggle('<%= chkRegional.ClientID %>', ['<%= txtRegionalDetail.ClientID %>']);

        // ---------- Section rail: scroll spy + click to scroll ----------
        var railItems = Array.prototype.slice.call(document.querySelectorAll('.rail-item'));
        var sections = railItems.map(function (item) { return document.getElementById(item.getAttribute('data-target')); });

        railItems.forEach(function (item) {
            item.addEventListener('click', function () {
                var target = document.getElementById(item.getAttribute('data-target'));
                if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            });
        });

        function onScroll() {
            var scrollY = window.scrollY || window.pageYOffset;
            var docHeight = document.documentElement.scrollHeight - window.innerHeight;
            var progress = docHeight > 0 ? Math.min(100, (scrollY / docHeight) * 100) : 0;
            var bar = document.getElementById('scrollProgress');
            if (bar) bar.style.width = progress + '%';

            var activeIndex = 0;
            sections.forEach(function (sec, i) {
                if (sec && sec.getBoundingClientRect().top - 120 <= 0) activeIndex = i;
            });
            railItems.forEach(function (item, i) {
                item.classList.toggle('active', i === activeIndex);
            });
        }
        window.addEventListener('scroll', onScroll, { passive: true });
        onScroll();
    })();
</script>

</body>
</html>
