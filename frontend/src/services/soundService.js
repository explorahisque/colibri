import { ref } from 'vue';

export const hasInteracted = ref(false);
export const soundEnabled = ref(true);

const sounds = {
  // Navigation sounds
  'navigation.hover': {
    ogg: '/sounds/navigation_hover-tap.ogg',
    wav: '/sounds/navigation_hover-tap.wav'
  },
  'navigation.forward': {
    ogg: '/sounds/navigation_forward-selection.ogg',
    wav: '/sounds/navigation_forward-selection.wav'
  },
  'navigation.back': {
    ogg: '/sounds/navigation_backward-selection.ogg',
    wav: '/sounds/navigation_backward-selection.wav'
  },
  'navigation.error': {
    ogg: '/sounds/navigation_unavailable-selection.ogg',
    wav: '/sounds/navigation_unavailable-selection.wav'
  },
  'navigation.complete': {
    ogg: '/sounds/navigation_selection-complete-celebration.ogg',
    wav: '/sounds/navigation_selection-complete-celebration.wav'
  },
  // UI interaction sounds
  'ui.tap': {
    ogg: '/sounds/ui_tap-variant-01.ogg',
    wav: '/sounds/ui_tap-variant-01.wav'
  },
  'ui.toggle': {
    ogg: '/sounds/ui_tap-variant-02.ogg',
    wav: '/sounds/ui_tap-variant-02.wav'
  },
  'ui.click': {
    ogg: '/sounds/ui_tap-variant-03.ogg',
    wav: '/sounds/ui_tap-variant-03.wav'
  },
  'ui.lock': {
    ogg: '/sounds/ui_lock.ogg',
    wav: '/sounds/ui_lock.wav'
  },
  'ui.unlock': {
    ogg: '/sounds/ui_unlock.ogg',
    wav: '/sounds/ui_unlock.wav'
  },
  // Alert sounds
  'alert.error': {
    ogg: '/sounds/alert_error-01.ogg',
    wav: '/sounds/alert_error-01.wav'
  },
  'alert.warning': {
    ogg: '/sounds/alert_simple.ogg',
    wav: '/sounds/alert_simple.wav'
  },
  'alert.success': {
    ogg: '/sounds/notification_simple-01.ogg',
    wav: '/sounds/notification_simple-01.wav'
  },
  // State changes
  'state.confirm.up': {
    ogg: '/sounds/state-change_confirm-up.ogg',
    wav: '/sounds/state-change_confirm-up.wav'
  },
  'state.confirm.down': {
    ogg: '/sounds/state-change_confirm-down.ogg',
    wav: '/sounds/state-change_confirm-down.wav'
  },
  // Transitions
  'transition.left': {
    ogg: '/sounds/navigation_transition-left.ogg',
    wav: '/sounds/navigation_transition-left.wav'
  },
  'transition.right': {
    ogg: '/sounds/navigation_transition-right.ogg',
    wav: '/sounds/navigation_transition-right.wav'
  },
  // Celebrations
  'celebration.simple': {
    ogg: '/sounds/hero_simple-celebration-01.ogg',
    wav: '/sounds/hero_simple-celebration-01.wav'
  },
  'celebration.decorative': {
    ogg: '/sounds/hero_decorative-celebration-01.ogg',
    wav: '/sounds/hero_decorative-celebration-01.wav'
  }
};

const audioCache = new Map();

export const enableSounds = () => {
  hasInteracted.value = true;
};

export const playSound = async (soundId, volume = 1.0) => {
  try {
    if (!hasInteracted.value || !soundEnabled.value) return;
    
    let audio = audioCache.get(soundId);
    
    if (!audio) {
      if (!sounds[soundId]) {
        console.warn(`Sound not found: ${soundId}`);
        return;
      }
      
      audio = new Audio();
      if (audio.canPlayType('audio/ogg') !== "") {
        audio.src = sounds[soundId].ogg;
      } else {
        audio.src = sounds[soundId].wav;
      }
      audioCache.set(soundId, audio);
    }
    
    audio.volume = volume;
    await audio.play();
  } catch (error) {
    console.error('Error reproduciendo sonido:', error);
  }
};

export const volumeLevels = {
  'navigation.hover': 0.2,
  'navigation.forward': 0.4,
  'navigation.back': 0.4,
  'navigation.error': 0.5,
  'navigation.complete': 0.6,
  'ui.tap': 0.3,
  'ui.toggle': 0.3,
  'ui.click': 0.3,
  'ui.lock': 0.4,
  'ui.unlock': 0.4,
  'alert.error': 0.6,
  'alert.warning': 0.5,
  'alert.success': 0.5,
  'state.confirm.up': 0.4,
  'state.confirm.down': 0.4,
  'transition.left': 0.3,
  'transition.right': 0.3,
  'celebration.simple': 0.5,
  'celebration.decorative': 0.6
};

// Establecer interacción al primer clic
document.addEventListener('click', enableSounds, { once: true });
