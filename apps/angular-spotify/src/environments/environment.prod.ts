import { AppConfig } from '@angular-spotify/web/shared/app-config';

const runtimeConfig = typeof window !== 'undefined' ? (window as any).__env || {} : {};

export const environment: AppConfig = {
  production: true,
  baseURL: 'https://api.spotify.com/v1',
  spotifyClientId: runtimeConfig.SPOTIFY_CLIENT_ID || ''
};
