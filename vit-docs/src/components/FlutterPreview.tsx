import React from 'react';

export interface FlutterPreviewProps {
  story: string;
  height?: number;
  title?: string;
}

export default function FlutterPreview({ 
  story, 
  height = 600,
  title = 'Live Preview'
}: FlutterPreviewProps): JSX.Element {
  return (
    <div className="flutter-preview-wrapper" style={{ marginBottom: '2rem' }}>
      {title && (
        <div style={{ 
          fontSize: '1.1rem', 
          fontWeight: 600, 
          marginBottom: '0.75rem',
          color: 'var(--ifm-font-color-base)'
        }}>
          {title}
        </div>
      )}
      <div 
        className="flutter-preview-container"
        style={{
          position: 'relative',
          width: '100%',
          maxWidth: '400px',
          margin: '0 auto',
          borderRadius: '12px',
          overflow: 'hidden',
          boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)',
          border: '1px solid var(--ifm-color-emphasis-200)',
        }}
      >
        <div style={{
          position: 'relative',
          paddingTop: '177.78%',
          backgroundColor: 'var(--ifm-background-surface-color)',
        }}>
          <iframe
            src={`/flutter-app/index.html?story=${encodeURIComponent(story)}`}
            title={`${story} Preview`}
            style={{
              position: 'absolute',
              top: 0,
              left: 0,
              width: '100%',
              height: '100%',
              border: 'none',
            }}
            loading="lazy"
          />
        </div>
        <div style={{
          padding: '0.5rem',
          backgroundColor: 'var(--ifm-color-emphasis-100)',
          textAlign: 'center',
          fontSize: '0.75rem',
          color: 'var(--ifm-color-emphasis-700)',
          borderTop: '1px solid var(--ifm-color-emphasis-200)',
        }}>
          Interactive Flutter Component
        </div>
      </div>
      <div style={{
        marginTop: '0.5rem',
        textAlign: 'center',
        fontSize: '0.875rem',
        color: 'var(--ifm-color-emphasis-600)',
      }}>
        Try interacting with the component above
      </div>
    </div>
  );
}
