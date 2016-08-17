# Auto Layout - Interface Builder


> I like turtles. 
 

## Learning Objectives

* 


## Outline / Notes

The student would have just learned about Frames & Bounds in relation to `UIView`'s. 

The iPhone 5, 6 and 6+ (who knows about the 7 right now) all have different screen sizes. Which means we really shouldn't just rely on creating our `UIView`'s by _just_ providing an origin and a size. Someone might be using our app on an iPhone 6+ and some might be using it on an iPhone 5--we need to account for that. Auto layout is the answer.

I think we should discuss how the initial scene in the `Main.storyboard` file of a new project is just a big giant white square. This doesn't look like an iPhone, nor an iPad. Apple doesn't make any square devices. This is the default layout that apple provides to us when we create an application. It's on us (the developer) to layout these various using Auto Layout so that way we account for any device this might run on in Apples lineup.

![](https://s3.amazonaws.com/learn-verified/IBFirstScreen.png)

Locating the Attributes Inspector, we can lay this out to reflect an actual iPhone (especially if we're going to be making an iPhone application).

![](https://s3.amazonaws.com/learn-verified/IBSizeExample.png)

Within the Size menu, we have choices:

![](https://s3.amazonaws.com/learn-verified/IBSizeChoices.png)

![](https://s3.amazonaws.com/learn-verified/iPhoneSizes.png)

I like to layout my views within in Xcode as if I'm working on an iPhone 6, so to simulate an iPhone 6--we would have to choose the iPhone 4.7-inch option.

After selecting that option, we should see this:

![](https://s3.amazonaws.com/learn-verified/IBIphone6.png)

Maybe we can then step into the `viewDidLoad()` in the `ViewController.swift` file to do something like this:

```swift
let blueView = UIView(frame: CGRect(x: 20.0, y: 20.0, width: 100.0, height: 100.0))
blueView.backgroundColor = UIColor.blueColor()
view.addSubview(blueView)
        
let redView = UIView(frame: CGRect(x: 100.0, y: 100.0, width: 40.0, height: 40.0))
blueView.backgroundColor = UIColor.redColor()
view.addSubview(redView)
```

Creating our views progrmatically like this, we get the following result when we run this on an iPhone 6+

### iPhone 6+:
![](https://s3.amazonaws.com/learn-verified/IB-iPhone6Plus.png)

### iPhone 4:
![](https://s3.amazonaws.com/learn-verified/IB-iPhone4.png)

This is no way to design an iOS application. Here we're wrestling with just two different `UIView`'s and on the iPhone 4S, the `redView` appears as if it's almost in the center and the `blueView` is taking up a large portion of the screen.

I'm not sure how great this example is here, maybe having them center just one view might be better to show them then we show how easy it is creating constraints within Interface Builder?

This will also be the first time they will be selecting various devices to run their application on, I think we should show them where they can do that:

![](https://s3.amazonaws.com/learn-verified/IB-Choices.png)

If we stick with my example of the `blueView` and `redView`. Maybe we can pose the following problem: What if we wanted to ensure (no matter what the device is) that the `blueView` remain in the top left portion of the device and the `redview` remain in the lower right of the device. Doing this by creating the frames of these particular views will be very tedious (and isn't the best answer).

We can use constrains within in Interface Builder.

First lets remove the code we had written in the `viewDidLoad()` method.

If we head back over to the `Main.storyboard` file, we can add two `UIViews` to the canvas, size them to be 150h x 150w, make one have a red background color, the other blue and drag them to the corners of the canvas, like so:

![](https://s3.amazonaws.com/learn-verified/IB-RedBlueView.png)

Considering this canvas we're working on is simulating the size of an iPhone 6, if we were to run this app on an iPhone 6 we would be met with the following screen which looks perfectly fine. But we have yet to add any constraints to these views, so if we were to run this on devices other than the iPhone 6 - it wouldn't look right.


### iPhone 6:
![](https://s3.amazonaws.com/learn-verified/IB-i6.png)

### iPhone 4:
The blue box doesn't even appear on screen.

![](https://s3.amazonaws.com/learn-verified/IB-i4.png)

### iPhone 5:

![](https://s3.amazonaws.com/learn-verified/IB-i5.png)

### iPhone 6+:

![](https://s3.amazonaws.com/learn-verified/IB-i6%2B.png)

Lets add some constraints going back to `Main.Storyboard`.

There are a few options we have here. We can tell them how they can control drag from the view object on the canvas to anywhere outside of that view to then be selected with various options on where we want to constrain this view to. Or, we can have them select the pin icon in the lower right which looks like a tie fighter. The tie fighter approach might be easier for them first (maybe?). In selecting this icon after our view is selected, we will want to click the red I line which will say - constrain this to the top of its closets view which is the `view` object we've placed this in (white background). Also, constrain it to the left of the `view`. As well, in checking off Width and Height, we are stating that the Height and Width must be 150 points.

![](https://s3.amazonaws.com/learn-verified/IB-ConstraintRedView.png)

Then they can click "Add Constraints"

Lets do the same with our `blueView`, except where do you think we want to constrain it to. To the lower right so we will click the I on the bottom and the I on the right giving it the same height and width constraints like so:

![](https://s3.amazonaws.com/learn-verified/IB-ConstraintBlueViewF.png)

After hitting Add 4 Constraints here, we should be good to go.

I think it would be nice to discuss how they can go through the various constraints they just made within this scene:

![](https://s3.amazonaws.com/learn-verified/IB-Overview.png)

What happens if we select the width constraint on the `redView` in this panel:

![](https://s3.amazonaws.com/learn-verified/IB-RedSelected.png)

We're given some options:

![](https://s3.amazonaws.com/learn-verified/IB-RedOptions.png)

We can change this constant to reflect a different size (if we want to), but we know we want it to be 150 x 150 so we will leave it alone. You have various options depending on the constraint amongst any constraint here on all our views.

What about that yellow warning symbol we see:

![](https://s3.amazonaws.com/learn-verified/IB-YelloWarning.png)

It means that our app will look different at run-time than what is displayed here in our canvas. So we need to fix that so we are working with what it is expected to look like when we run our app. With the `View` selected, in the lower right to the right of the tie fighter we have a triangle surrounded by | |'s, if we select that we have the following options:

![](https://s3.amazonaws.com/learn-verified/IB-ViewSelected.png)

We will want to select "Update Frames". This tells our canvas to reflect what our constraints. Whenever you add new constraints, sometimes the canvas can get out of sync with what it is the constraints are asking it to do, this will bring things back in sync. After clicking that the yellow warning should go away.

Now lets try to run it on all devices.

### iPhone 4:

![](https://s3.amazonaws.com/learn-verified/IB-4F.png)

### iPhone 5:

![](https://s3.amazonaws.com/learn-verified/IB-5F.png)

### iPhone 6:

![](https://s3.amazonaws.com/learn-verified/IB-6F.png)

### iPhone 6+:

![](https://s3.amazonaws.com/learn-verified/IB-6PlusFinal.png)














































































<a href='https://learn.co/lessons/AutoLayoutIB' data-visibility='hidden'>View this lesson on Learn.co</a>
