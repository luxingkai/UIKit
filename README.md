# UIKit 框架整体架构
UIKit框架为你的iOS或tvOS应用提供了必要的基础设施。它提供了窗口和视图体系结构实现界面,事件处理的基础设施提供多点触控和其他类型的应用程序的输入,和主要运行循环需要管理用户之间的交互,系统和应用程序。框架提供的其他功能包括动画支持、文档支持,绘制和打印支持,当前设备信息,文本管理和显示,搜索支持可访问性的支持,应用程序扩展支持和资源管理。       

<1>.必要性：了解UIKit和Xcode为你的iOS和tvOS应用提供的基本支持。       
           保护个人数据，尊重用户对数据使用方式的偏好。     

<2>.App架构：UIKit管理你的应用与系统的交互，并为你提供类来管理你的应用的数据和资源。       
    ·App和环境         
        ·Life Cycle: 管理生命周期、响应app的加载、UIApplication、UIApplicationDeleagte      
        ·Device Environment: (UIDevice、UIStatusBarManager)        
        ·Adaptivity: UITraitCollection、UITraitEnvironment）    
        ·Guided Access: 一组用于在iOS中为引导访问特性添加自定义限制的方法。   
        ·Architecture : 通过调整应用程序以支持操作系统的后续版本，确保应用程序的行为符合预期。   
    ·文档、数据和粘贴板    
        ·文档   
        ·数据管理   
        ·粘贴板    
    ·资源管理   
        ·storyboards    
        ·assets   
        ·nib files    
    ·App扩展    
        ·扩展支持   
        ·文档助手   
        ·自定义键盘    
    ·内部应用间通信    
        ·Universal link (使用通用链接链接到您的应用程序内的内容，并安全地共享数据。)   
        ·User Activities （表示应用程序在某一时刻的状态。）    
        ·Services (一个抽象类，您可以子类化它来实现特定于应用程序的服务。)   
        
<3>. 用户界面： 视图帮助您在屏幕上显示内容，并方便用户交互;视图控制器帮助你管理视图和界面的结构。    
     · 视图(view)和控制(controls): 展示和交互   
     · 控制器(ViewController)：使用视图控制器管理你的界面，并在你的应用程序的内容周围导航。   
     · 视图布局: 使用堆栈视图自动布局接口的视图。当您需要视图的精确位置时，请使用自动布局。  
     · 自定义展示：     
          · 暗黑模式(Dark Mode)   
          · 导航栏展示     
          · 工具栏展示   
          · 标签栏(TabBar)   
          · 共享展示(shared appearance)   
          · 展示代理    
     · 动画及触觉：     
          · 内容动画 (属性动画及控制器过渡动画及自定义过渡动画)   
          · 基础物理动画： UIDynamicAniamtor和 UIDynamicBehavior    
          · 视差效果(Motion Effects)：添加微妙的运动到视图，以提供一个三维外观。  
          · 触觉反馈: 针对特定类型的事件提供触觉反馈。    
               ·UIFeedbackGenerator     
               ·UIImpactFeedbackGenerator   
               ·UINotificationFeedbackGenerator   
               ·UISelectionFeedbackGenerator    
     · 窗口和屏幕： 为视图层次结构和其他内容提供一个容器。   
     
<4>. 用户交互：响应器和手势识别器帮助你处理触摸和其他事件。拖放、焦点、查看和弹出，以及可访问性处理其他用户交互。   
     ·接触、按压和手势    
     ·拖拽和推动       
     ·指针的交互(UIPointerInteraction)：在自定义控件和视图中支持指针交互。   
     ·铅笔的交互(Pencil Interactions): 处理苹果铅笔上的双击用户交互。   
     ·基于遥控导航：使用遥控器或游戏控制器来导航UIKit应用程序的界面。    
     ·菜单和快捷键: 使用菜单系统、上下文菜单、主屏幕快速操作和键盘快捷键简化与应用程序的交互。   
     ·可访问性： 让你的应用程序对所有人开放，包括残疾人   
     
<5>. 图形、绘图和打印 UIKit提供了类和协议来帮助你配置你的绘图环境和渲染你的内容。    
     ·图片和PDF    
     ·图形绘制    
     ·打印    
          
<6>. 文本： 除了简化应用程序中显示文本的文本视图外，UIKit还提供了支持系统键盘的自定义文本管理和呈现。    
     ·文本展示和字体: 显示文本、管理字体和检查拼写。      
     ·文本存贮 :管理文本存储，协调文本布局。    
     ·键盘输入： 配置系统键盘，创建自己的键盘来处理输入，或检测物理键盘上的按键。    
   
   
   
   
   
   
      
      