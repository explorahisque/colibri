import { playSound } from '@/services/soundService';

export function setupSoundNavigation(router) {
  router.beforeEach((to, from, next) => {
    // Play transition sound based on navigation direction
    if (from.name) {
      const backLinks = ['/', '/dashboard'];
      const isGoingBack = backLinks.includes(to.path) || to.path < from.path;
      playSound(isGoingBack ? 'navigation.back' : 'navigation.forward', 0.4);
    }
    next();
  });

  router.onError(() => {
    playSound('navigation.error', 0.5);
  });
}

export const soundMixin = {
  methods: {
    playUISound(type = 'ui.tap', volume = 0.3) {
      playSound(type, volume);
    },
    playAlertSound(type = 'success', volume = 0.5) {
      playSound(`alert.${type}`, volume);
    },
    playCelebrationSound(type = 'simple', volume = 0.5) {
      playSound(`celebration.${type}`, volume);
    }
  }
};
