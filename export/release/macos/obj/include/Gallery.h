#ifndef INCLUDED_Gallery
#define INCLUDED_Gallery

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_MusicBeatState
#include <MusicBeatState.h>
#endif
HX_DECLARE_CLASS0(AttachedSprite)
HX_DECLARE_CLASS0(Gallery)
HX_DECLARE_CLASS0(MusicBeatState)
HX_DECLARE_CLASS1(flixel,FlxBasic)
HX_DECLARE_CLASS1(flixel,FlxObject)
HX_DECLARE_CLASS1(flixel,FlxSprite)
HX_DECLARE_CLASS1(flixel,FlxState)
HX_DECLARE_CLASS3(flixel,addons,transition,FlxTransitionableState)
HX_DECLARE_CLASS3(flixel,addons,transition,TransitionData)
HX_DECLARE_CLASS3(flixel,addons,ui,FlxUIState)
HX_DECLARE_CLASS4(flixel,addons,ui,interfaces,IEventGetter)
HX_DECLARE_CLASS4(flixel,addons,ui,interfaces,IFlxUIState)
HX_DECLARE_CLASS2(flixel,group,FlxTypedGroup)
HX_DECLARE_CLASS2(flixel,text,FlxText)
HX_DECLARE_CLASS2(flixel,tweens,FlxTween)
HX_DECLARE_CLASS2(flixel,util,IFlxDestroyable)



class HXCPP_CLASS_ATTRIBUTES Gallery_obj : public  ::MusicBeatState_obj
{
	public:
		typedef  ::MusicBeatState_obj super;
		typedef Gallery_obj OBJ_;
		Gallery_obj();

	public:
		enum { _hx_ClassId = 0x199a6d3e };

		void __construct( ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="Gallery")
			{ return ::hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return ::hx::Object::operator new(inSize+extra,true,"Gallery"); }
		static ::hx::ObjectPtr< Gallery_obj > __new( ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut);
		static ::hx::ObjectPtr< Gallery_obj > __alloc(::hx::Ctx *_hx_ctx, ::flixel::addons::transition::TransitionData TransIn, ::flixel::addons::transition::TransitionData TransOut);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(::hx::DynamicArray inArgs);
		//~Gallery_obj();

		HX_DO_RTTI_ALL;
		::hx::Val __Field(const ::String &inString, ::hx::PropertyAccess inCallProp);
		::hx::Val __SetField(const ::String &inString,const ::hx::Val &inValue, ::hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_("Gallery",72,a8,08,c8); }

		int curSelected;
		 ::flixel::group::FlxTypedGroup grpOptions;
		::Array< ::Dynamic> iconArray;
		::Array< ::Dynamic> creditsStuff;
		 ::flixel::group::FlxTypedGroup menuItems;
		 ::flixel::FlxSprite bg;
		 ::flixel::text::FlxText descText;
		int intendedColor;
		 ::flixel::tweens::FlxTween colorTween;
		 ::flixel::FlxSprite weekSprites;
		Float offsetThing;
		void create();

		bool quitting;
		Float holdTime;
		void update(Float elapsed);

		 ::flixel::tweens::FlxTween moveTween;
		void changeSelection(::hx::Null< int >  change);
		::Dynamic changeSelection_dyn();

		::Array< ::String > modsAdded;
		void pushModCreditsToList(::String folder);
		::Dynamic pushModCreditsToList_dyn();

		 ::Dynamic getCurrentBGColor();
		::Dynamic getCurrentBGColor_dyn();

		bool unselectableCheck(int num);
		::Dynamic unselectableCheck_dyn();

};


#endif /* INCLUDED_Gallery */ 
