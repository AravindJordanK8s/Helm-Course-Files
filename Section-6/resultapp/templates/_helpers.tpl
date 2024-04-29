{{/* 
Name of the Release
*/}}
{{- define "resultapp.releasename" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* 
Current Release Labels
*/}}
{{- define "resultapp.Labels" -}}
deploy: {{ .Values.resultapp.deploy }}
{{- end }}

{{/* 
Current Release MatchLabels
*/}}
{{- define "resultapp.selectorLabels" -}}
name: {{ .Values.resultapp.name }}
tier: {{ .Values.resultapp.tier }}
{{- end }}