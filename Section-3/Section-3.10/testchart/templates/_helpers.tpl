{{/* Common Labels in Deployment*/}}
{{- define "testchart.commonlabels" }}
    app.kubernetes.io/name: {{ .Release.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}-{{ .Chart.Name }}
    app.kubernetes.io/version: {{ .Chart.Version }}
    app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "testchart.selectorlabels" }}
    app.kubernetes.io/name: {{ .Release.Name }}
    app.kubernetes.io/instance: {{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{- define "testchart.ResourceName" }}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "testchart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "testchart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "testchart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "testchart.labels" -}}
helm.sh/chart: {{ include "testchart.chart" . }}
{{ include "testchart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "testchart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "testchart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "testchart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "testchart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
