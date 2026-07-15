Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C348BD39
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130790; cv=pass; b=jAoxhVSjtHVUFMpSIA2AEMWp1xZIpAmqrLeWgrZuce1lnIc8VQsYnpt7iAlkjMwtnNnOwYsgfcq99tIm15zcPDsva+DoF/Q0knhsr/0qZATdHmzy9qDNVwXDl7HnxTIHCCSKz1zJ1HgxraVdPAHqj3siMhECjA/2FMJW34tSsng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130790; c=relaxed/simple;
	bh=q6cKBZdpYUeBw2lS1ypmmwqf8CCdyOQyy3KXC5MRLFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jf7vUG0Q9xksEr+dq+8W0TDwSwtz9UDYjKrMFTcVgcS7Ot7wd/tMMkjpRq9xd97I1p6cHGT215RGFycPwEx0AFDkLYq/aAA+4cNMyqdnnPY24BNucIiOejRTritlezehTpBo7OhH7W3RnkalppHDh5SrFuK4HXP303Q8S3dk4Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8vk3eME; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8vk3eME"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47df6a5202bso3655491f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 08:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784130787; cv=none;
        d=google.com; s=arc-20260327;
        b=ET+CU+PCJ+azadyE81FDQtPS44eiHpYETH2APyjpD3vY5/0DZaO4ETltejbg45YWhh
         2BJqLU6CTrls669FOLoFvcEhxjrtAeH0mdz3aO0b4d+Z3iNKTu6OW+JbatAGGwORD8Cg
         sQxxEmvqFwC4dlYcX7/LKtbzcxkaInVDLVZsWXHlQpduYhuEtydVdw153GN4lRZfE/0x
         uAGDUbojJ8SOM1JSjErv7/LqT87ARf/9NhGE13OttU1sVCqchMHLpiwJl6aHtxleX0oc
         sW1wX9T5TpWP0o0ow+2k2Pq5zE4E9oVLhoCBgO11unmokg7dthIVCbr14LpkxI9TJDGb
         Y/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q6cKBZdpYUeBw2lS1ypmmwqf8CCdyOQyy3KXC5MRLFQ=;
        fh=qy1XGcwQJ7tTsUEI4c0bPXBnnRg8uab3iC6zgA6+L3w=;
        b=GaHhsbzxpjiAIRo1aX4xNHuzPkziQH5WhMRjy0TGEXY1HW9uZCX9R/5LVZmx8me/AW
         AdAnv7CIgptPpkuOgaas9OCiJNNLUEokTmUQ5Rl/wVoy8qu77veUzfl3iNFaLzUvuwO0
         kc82Ht2EmleUq6YPDuH+pUtTnZgq12ZDKqvjE8XnYNErj3rskIXPwzmMcSqO8CtMrGQN
         Zr7P93pF1K+MKndZ1Oe5F8VXhMgTXmUpwWHtPMK6VTQ2BZr9MoXbSSgMQ3UNcxmobCFw
         367Wlzlf+DbFLW8zUs/nBLwzf+Hd7ImMFDft44D/kX637AjyWXbMp30AlTEcKWm0Srnc
         8U2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784130787; x=1784735587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q6cKBZdpYUeBw2lS1ypmmwqf8CCdyOQyy3KXC5MRLFQ=;
        b=a8vk3eMECvxwcXWIElE+lcfNPUUj6u1peyqekmY7Nd81PDH3zHHa+UGptZS6y0CqwX
         9MRa4sPRFvUaTbqV4DCxXOSEnJKGINK9Dhx9KHvPlxElrBSacZC6eAmetsaL/5rBGqcT
         SYXD11GrHYCT3FeGPFhByckiC9aqBoAyV9CJKxUl/mf5seWKfsituhl++7thzzDeTxtC
         6/rR0pi3v+HYuSxvXltD7/x8flDuk26LdL+bCkIe/dbwURQYBcBghWXh4qA3GyOVgUDP
         4UOLwNN1Hs/SndJvsSTJ6t2KQ+G0uBTauHqguPPRrKmT2RM8XKXHfVSfaC/+ENMcb9g1
         n9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130787; x=1784735587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6cKBZdpYUeBw2lS1ypmmwqf8CCdyOQyy3KXC5MRLFQ=;
        b=SVCDIf75VfauRaGbeXU6jc2cBkAqLHMN7w2HqmcsBoB7v2INR2reXig1kq95oNjmo1
         LIrF/t5k26mcYw+P3PpZd0P7k42HhmBg+lLvv6joEbG0rDvCNLstenr4dhnaQUSzxNPD
         WvppYJ+hNyfytA3dWBVmRI/U5FLdYQ9ADQWSrRyQgWOgr4DVvQgPWozdRs7D4VVwL2xu
         C09yLeLA8W1ZYfsNTJQgZvfZpLcf7RcvSJCf0Wct2n8L42CzfmpBgZl6bRuRIYM1Lv0F
         96i2j6u3bX4RxRYkxfscPgUZp/TvOq8rCgvtdLbB51g3nqqXxxF+f0i/c2Eyy9heyggA
         a59A==
X-Forwarded-Encrypted: i=1; AHgh+Rrwgm3P1SZBSWTnVtLum4P5zp3QxKB0zE5Y6pNvBAa/iazOPwXAAHrTVsQMueJ0DedltAAqs4NLwLcU@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+YnkoWbnLgaTbBVvQ6+5TwYPM7nCNvbF3FSK/q6C7VOAW8IBT
	qE8Qq90IR1WW6Tn8j6hSfyB8ZshLCy6Rqma1U74GBmgW0j7iG+cAscydPCBeZGIsNsHWXFBjcZM
	7MoGV7p07ea+J0U7LaR1Ot8L8y5sxPLc=
X-Gm-Gg: AfdE7claoJ6nhbQlWrp+c4KsG2jaOaC4th52Rc8CxW3T5yrpXYUu1OS19WQuHDM1lrJ
	sBCBTFl3rF2b8mQyLk41yWe+arj4NvIynzH1rqTZojT2EjtHae8i0qa07ue2HntKVbtDjcV+OZO
	sSBWWvis3BYcq/GFtcDcuqVfGZV0Wi9O8i+NVoH9wR3NpOz+gUO+ka+WMSLpkF4Op57SPL9eMK6
	t47d9jNltLeFmq2P7zqmi2p2vIZL4nUy3s/cAILT/RDGES1mmbM1qD1Y5JabZuX15+ZoG8bibrE
	0eAnFmKZK4BW932QI/ePZkzIdyl4OEXXHuppiK0kzEmQdtGGC1baPswsCwUUcVI=
X-Received: by 2002:a05:6000:4201:b0:475:e3fe:8ac3 with SMTP id
 ffacd0b85a97d-47f4fca86eemr3714736f8f.8.1784130787042; Wed, 15 Jul 2026
 08:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713175345.2542331-1-joannelkoong@gmail.com>
 <CAJnrk1b9jjvP6a9PaYAiA0HZcJ0_dR_O2aGWPF44T2NNBJC94w@mail.gmail.com>
 <CAJnrk1Zo_j_QY9Q=jft5=fio9mU36uy5LXP3bC4=xO8DbakzrA@mail.gmail.com> <CAOQ4uxg1m0C6suUpoO8hNkgnqEH-APV3BJgzKg2biCEoC6kXVw@mail.gmail.com>
In-Reply-To: <CAOQ4uxg1m0C6suUpoO8hNkgnqEH-APV3BJgzKg2biCEoC6kXVw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 15 Jul 2026 08:52:55 -0700
X-Gm-Features: AUfX_myi4_L8KFJGelEiwEMm_-nESlXVjSp_TxBdEh6JNd5VUFZ0yTAoUU0lPks
Message-ID: <CAJnrk1ZBQQy5pwBQmDwKvumcGkUT5dhtQz=D8FwO-j2LWA-EJA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] fuse: fix missing barriers in io-uring init
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, fuse-devel@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:22=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Jul 14, 2026 at 1:51=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Mon, Jul 13, 2026 at 3:11=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > On Mon, Jul 13, 2026 at 10:54=E2=80=AFAM Joanne Koong <joannelkoong@g=
mail.com> wrote:
> > > >
> > > > These are two pre-existing issues Sashiko reported [1] on the fuse =
zerocopy
> > > > series.
> > > >
> > > > [1] https://sashiko.dev/#/patchset/20260630211436.2062816-1-joannel=
koong%40gmail.com
> > >
> > > Sashiko noted some other places that are also missing barriers [1].
> > > Will send v2 to add these places as well.
> >
> > These additional ones aren't real bugs. They're not reachable on a
> > well-behaved server and on a malicious/buggy server, the failure is
> > benign / self-correcting.
> >
> > I think we need some sort of way to help Sashiko understand so it
> > doesn't keep flagging this on every future patch anyone submits. I
> > think there's a few other places where some of Sashiko's
> > assumptions/analysis are wrong (eg uring-cmd sqe stability semantics
> > [1] in the zero-copy series). I'll look into this unless anyone
> > already knows how to do this.
>
> You may want to talk with your colleague Chris Mason about adding review
> prompts for FUSE, because he is also running AI analysis on existing subs=
ystems
> regardless of mailing list patches.
> I didn't try, but you can probably figure out how to add FUSE specific
> review prompts
> to Sashiko yourself...
>
> Thanks,
> Amir.

The prompts Sashiko uses are in this subdirectory, which is open
source and anyone can contribute:
https://github.com/sashiko-dev/sashiko/tree/main/third_party/prompts/kernel=
/subsystem

I added a minimal fuse prompt [1], I think we can continue improving
on that as we go.

Thanks,
Joanne

[1] https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/ke=
rnel/subsystem/fuse.md
