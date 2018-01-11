// Generated by Apple Swift version 4.0.3 (swiftlang-900.0.72 clang-900.0.38)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_attribute(external_source_symbol)
# define SWIFT_STRINGIFY(str) #str
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name) _Pragma(SWIFT_STRINGIFY(clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in=module_name, generated_declaration))), apply_to=any(function, enum, objc_interface, objc_category, objc_protocol))))
# define SWIFT_MODULE_NAMESPACE_POP _Pragma("clang attribute pop")
#else
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name)
# define SWIFT_MODULE_NAMESPACE_POP
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import UIKit;
@import Foundation;
@import CoreGraphics;
@import FSCalendar;
@import ObjectiveC;
@import WebKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

SWIFT_MODULE_NAMESPACE_PUSH("SiberSuclarTanitim")
@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC18SiberSuclarTanitim11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions SWIFT_WARN_UNUSED_RESULT;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIButton;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC18SiberSuclarTanitim18BaseViewController")
@interface BaseViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)onSlideMenuButtonPressed:(UIButton * _Nonnull)sender;
- (void)onLogoutButtonPressed:(UIButton * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextView;
@class UIImageView;
@class UISwipeGestureRecognizer;

SWIFT_CLASS("_TtC18SiberSuclarTanitim16BaskanlikTanitim")
@interface BaskanlikTanitim : BaseViewController
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified tanitimText;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified tanitimAmblem;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)viewWillAppear:(BOOL)animated;
- (void)backGestureWithSender:(UISwipeGestureRecognizer * _Nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;

SWIFT_CLASS("_TtC18SiberSuclarTanitim10DuyuruCell")
@interface DuyuruCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified duyuruLabel;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;

SWIFT_CLASS("_TtC18SiberSuclarTanitim25DuyuruPopUpViewController")
@interface DuyuruPopUpViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified popUpView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified duyuruTitleLabel;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified duyuruTextLabel;
- (IBAction)exitButtonWithSender:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UICollectionView;
@class UITableView;
@class UICollectionViewCell;

SWIFT_CLASS("_TtC18SiberSuclarTanitim17DuyurularHaberler")
@interface DuyurularHaberler : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UICollectionView * _Null_unspecified haberCollectionView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified HaberlerLabel;
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified duyuruTableView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified duyurularLabel;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim10EgitimCell")
@interface EgitimCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified baslikLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified tarihLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified saatLabel;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim25EgitimPopUpViewController")
@interface EgitimPopUpViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UIView * _Null_unspecified popUpView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified egitimTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified egitimBaslangicTarihiLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified egitimBitisTarihiLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified egitimSaatLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified egitimToplamSureLabel;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified egitimTextLabel;
- (IBAction)exitButtonWithSender:(id _Nonnull)sender;
- (IBAction)goToMapButtonWithSender:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim23EgitimlerViewController")
@interface EgitimlerViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified egitimlerTableView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim12EtkinlikCell")
@interface EtkinlikCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified etkinlikAdi;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified etkinlikYeri;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class FSCalendar;

SWIFT_CLASS("_TtC18SiberSuclarTanitim29EtkinlikTakvimiViewController")
@interface EtkinlikTakvimiViewController : BaseViewController <FSCalendarDataSource, FSCalendarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified etkinlikTableView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)calendar:(FSCalendar * _Nonnull)calendar didSelectDate:(NSDate * _Nonnull)date atMonthPosition:(FSCalendarMonthPosition)monthPosition;
- (NSInteger)calendar:(FSCalendar * _Nonnull)calendar numberOfEventsForDate:(NSDate * _Nonnull)date SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim12FaaliyetCell")
@interface FaaliyetCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified baslikLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified tarihLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified yerLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified baslik;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified tarih;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified yer;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim25FaaliyetlerViewController")
@interface FaaliyetlerViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified faaliyetTableView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UICollectionViewLayoutAttributes;

SWIFT_CLASS("_TtC18SiberSuclarTanitim9HaberCell")
@interface HaberCell : UICollectionViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Nullable haberImage;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified haberLabel;
- (UICollectionViewLayoutAttributes * _Nonnull)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes * _Nonnull)layoutAttributes SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim25HaberDetailViewController")
@interface HaberDetailViewController : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) IBOutlet UICollectionView * _Null_unspecified haberDetayCollectionView;
@property (nonatomic, weak) IBOutlet UITextView * _Null_unspecified haberDetayAciklama;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified haberBaslik;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextField;

SWIFT_CLASS("_TtC18SiberSuclarTanitim24IstekOneriViewController")
@interface IstekOneriViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UITextField * _Nullable subjectTextField;
@property (nonatomic, weak) IBOutlet UITextView * _Nullable requestTextView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)sendButton:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim19LoginViewController")
@interface LoginViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified kullaniciAdiField;
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified sifreField;
- (IBAction)loginButtonPressed:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim18MenuViewController")
@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
/// <ul>
///   <li>
///     Array to display menu options
///   </li>
/// </ul>
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified tblMenuOptions;
/// <ul>
///   <li>
///     Transparent button to hide menu
///   </li>
/// </ul>
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified btnCloseMenuOverlay;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)viewWillAppear:(BOOL)animated;
- (IBAction)onCloseMenuClick:(UIButton * _Null_unspecified)button;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITapGestureRecognizer;

SWIFT_CLASS("_TtC18SiberSuclarTanitim15ModernSearchBar")
@interface ModernSearchBar : UISearchBar <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
- (nonnull instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText;
- (void)searchBarTextDidBeginEditing:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarTextDidEndEditing:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarSearchButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarCancelButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (BOOL)searchBarShouldEndEditing:(UISearchBar * _Nonnull)searchBar SWIFT_WARN_UNUSED_RESULT;
- (BOOL)searchBarShouldBeginEditing:(UISearchBar * _Nonnull)searchBar SWIFT_WARN_UNUSED_RESULT;
/// Handle click on shadow view
- (void)onClickShadowView:(UITapGestureRecognizer * _Nonnull)sender;
/// Remove focus when you tap outside the searchbar
- (void)removeFocus:(UITapGestureRecognizer * _Nonnull)sender;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)observeValueForKeyPath:(NSString * _Nullable)keyPath ofObject:(id _Nullable)object change:(NSDictionary<NSKeyValueChangeKey, id> * _Nullable)change context:(void * _Nullable)context;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim19ModernSearchBarCell")
@interface ModernSearchBarCell : UITableViewCell
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)awakeFromNib;
@end

@class ModernSearchBarModel;

SWIFT_PROTOCOL("_TtP18SiberSuclarTanitim23ModernSearchBarDelegate_")
@protocol ModernSearchBarDelegate <UISearchBarDelegate>
@optional
- (void)onClickShadowViewWithShadowView:(UIView * _Nonnull)shadowView;
- (void)onClickItemSuggestionsViewWithItem:(NSString * _Nonnull)item;
- (void)onClickItemWithUrlSuggestionsViewWithItem:(ModernSearchBarModel * _Nonnull)item;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim19ModernSearchBarIcon")
@interface ModernSearchBarIcon : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim20ModernSearchBarModel")
@interface ModernSearchBarModel : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim10RehberCell")
@interface RehberCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified myView;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified surnameLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified dutyLabel;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified name;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified surname;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified duty;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim30RehberCellDetailViewController")
@interface RehberCellDetailViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified personelPhoto;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified sicil;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified rutbe;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified adi;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified soyadi;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified sube;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified gorevi;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified gsm;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified dahili;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified eposta;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim20RehberViewController")
@interface RehberViewController : BaseViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UISearchBar * _Null_unspecified searcBarRehber;
@property (nonatomic, weak) IBOutlet UITableView * _Null_unspecified RehberTableView;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIProgressView;
@class UIPickerView;
@class WKWebView;

SWIFT_CLASS("_TtC18SiberSuclarTanitim27ServisRehberiViewController")
@interface ServisRehberiViewController : BaseViewController <UIPickerViewDataSource, UIPickerViewDelegate, WKUIDelegate>
@property (nonatomic, strong) IBOutlet UIProgressView * _Null_unspecified progressView;
@property (nonatomic, weak) IBOutlet UIPickerView * _Null_unspecified pickerView;
@property (nonatomic, weak) IBOutlet WKWebView * _Null_unspecified webView;
- (void)viewDidLoad;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * _Nonnull)pickerView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)pickerView:(UIPickerView * _Nonnull)pickerView numberOfRowsInComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)pickerView:(UIPickerView * _Nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component SWIFT_WARN_UNUSED_RESULT;
- (void)pickerView:(UIPickerView * _Nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim26WeatherTableViewController")
@interface WeatherTableViewController : UITableViewController <ModernSearchBarDelegate>
@property (nonatomic, weak) IBOutlet ModernSearchBar * _Null_unspecified modernSearchBar;
- (void)viewDidLoad;
- (void)searchBarSearchButtonClicked:(UISearchBar * _Nonnull)searchBar;
/// ///////////////////////////////////
/// Called if you use String suggestion list
- (void)onClickItemSuggestionsViewWithItem:(NSString * _Nonnull)item;
/// Called if you use Custom Item suggestion list
- (void)onClickItemWithUrlSuggestionsViewWithItem:(ModernSearchBarModel * _Nonnull)item;
/// Called when user touched shadowView
- (void)onClickShadowViewWithShadowView:(UIView * _Nonnull)shadowView;
/// /////////////////////////////////
- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText;
- (void)didReceiveMemoryWarning;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)tableView:(UITableView * _Nonnull)tableView titleForFooterInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC18SiberSuclarTanitim9YemekCell")
@interface YemekCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified yemekTipi;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified yemekAdi;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified yemekFiyati;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified yemekImage;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER SWIFT_AVAILABILITY(ios,introduced=3.0);
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITabBar;
@class UITabBarItem;

SWIFT_CLASS("_TtC18SiberSuclarTanitim25YemekMenusuViewController")
@interface YemekMenusuViewController : BaseViewController <UITabBarDelegate, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView * _Nullable mealTableView;
@property (nonatomic, weak) IBOutlet UITabBar * _Nullable mealTabBar;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tabBar:(UITabBar * _Nonnull)tabBar didSelectItem:(UITabBarItem * _Nonnull)item;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

SWIFT_MODULE_NAMESPACE_POP
#pragma clang diagnostic pop
