import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Dental Clinic',
      'home': 'Home',
      'treatments': 'Treatments',
      'booking': 'Book Appointment',
      'about': 'About Us',
      'prices': 'Prices',
      'contact': 'Contact',
      'book_now': 'Book Now',
      'welcome_msg': 'Premium Dental Care for Your Perfect Smile',
      'welcome_sub': 'Modern technology and experienced professionals.',
      'location': 'Location',
      'hours': 'Working Hours',
      'contact_info': 'Contact Info',
      'services': 'Our Services',
      'testimonials': 'Patient Reviews',
      'available_slots': 'Available Slots Today',
      'cleaning': 'Dental Cleaning',
      'orthodontics': 'Orthodontics',
      'implants': 'Dental Implants',
      'whitening': 'Teeth Whitening',
      'cleaning_desc': 'Professional plaque and tartar removal.',
      'orthodontics_desc': 'Braces and clear aligners to straighten teeth.',
      'implants_desc': 'Permanent replacement for missing teeth.',
      'whitening_desc': 'Safe and effective teeth whitening treatments.',
      'philosophy': 'Our Philosophy',
      'team': 'Our Team',
      'send_message': 'Send Message',
      'name': 'Name',
      'email': 'Email',
      'message': 'Message',
      'select_date': 'Select Date',
      'select_time': 'Select Time Slot',
      'confirm_booking': 'Confirm Booking',
      'booking_success': 'Appointment confirmed successfully!',
      'language': 'Language',
    },
    'es': {
      'title': 'Clínica Dental',
      'home': 'Inicio',
      'treatments': 'Tratamientos',
      'booking': 'Reservar Turno',
      'about': 'Sobre Nosotros',
      'prices': 'Precios',
      'contact': 'Contacto',
      'book_now': 'Sacar Turno',
      'welcome_msg': 'Cuidado dental premium para tu sonrisa perfecta',
      'welcome_sub': 'Tecnología moderna y profesionales con experiencia.',
      'location': 'Ubicación',
      'hours': 'Horarios de Atención',
      'contact_info': 'Información de Contacto',
      'services': 'Nuestros Servicios',
      'testimonials': 'Testimonios de Pacientes',
      'available_slots': 'Turnos disponibles hoy',
      'cleaning': 'Limpieza Dental',
      'orthodontics': 'Ortodoncia',
      'implants': 'Implantes Dentales',
      'whitening': 'Blanqueamiento',
      'cleaning_desc': 'Remoción profesional de placa y sarro.',
      'orthodontics_desc':
          'Brackets y alineadores transparentes para enderezar los dientes.',
      'implants_desc': 'Reemplazo permanente para dientes faltantes.',
      'whitening_desc':
          'Tratamientos de blanqueamiento dental seguros y efectivos.',
      'philosophy': 'Nuestra Filosofía',
      'team': 'Nuestro Equipo',
      'send_message': 'Enviar Mensaje',
      'name': 'Nombre',
      'email': 'Correo',
      'message': 'Mensaje',
      'select_date': 'Seleccionar Fecha',
      'select_time': 'Seleccionar Horario',
      'confirm_booking': 'Confirmar Reserva',
      'booking_success': '¡Turno confirmado con éxito!',
      'language': 'Idioma',
    },
  };

  String get(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
