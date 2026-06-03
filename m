Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D3312819
	for <fuse-devel@lists.linux.dev>; Wed,  3 Jun 2026 17:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509353; cv=pass; b=nnCLI+rw5Pv1KU6BnblodYyhKYEOcAzwNMAZS3JwUMcfmeL84juhtoKaoAMWsFbuntVSQ7O+xdG3zBGAzHYUr8o8rIsxWVLRughak73MIOFyEkmwxk5NpbqrtD59cDPG1wyqJY2FRh4oOBGimJ/5iW66/kWVcJ/uyxRId/G9WxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509353; c=relaxed/simple;
	bh=WgI/ZGVKw4mwOCmGo0JdeP90XPjqyJl8Cea8ro3/A9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1+B5vQv1OnhtwcbHDnqqpAuXGArOLiO8snLG84jCtHiNmrVZtvOBj9NUf05hS9TGCp9kZtN6KskseRX/ug5rV+J97jmxTd8fEp3VNlU8Sg4Pamz+pOcqd8P7qEgFhFyQHOrXxhbjLt6RpLAiwkuyg7xFBXJrpLo/mUk/JMsc8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekKTw3Ds; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekKTw3Ds"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so4406399f8f.2
        for <fuse-devel@lists.linux.dev>; Wed, 03 Jun 2026 10:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780509351; cv=none;
        d=google.com; s=arc-20240605;
        b=eZ4mXMHY0ku65D+lIF/088yL+7EeveUe8Pf/yZ4H/85Qoj463SkOitsJiKFIQyaATo
         uFjVUD6yRqJ4EYD8OxS74pBjNyOBT3R3bobr8z/Aq5yvllxnUVlpbdcJbKujFFp7OupK
         LiVVOt7JQ8IebAWObg8jTMstBx8Uv1mtCLCuv4cef6OU/ugS7x2OgbIul1sJ+RX8nUs7
         4Wya1Jd1dDLSlypniysuZOKxolbjsgtbHC2Ulml5BpEeIQhVjNEosE+j51UAjTmJ264V
         c0ZIFgdEpOTrv56Q2Hcmz/CtdPhZkX3UAxvPe+baqRdZNzsc6dQ2bMXmZFz4aY0RSgye
         14RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=96WV0R1ZRprp/ANw1+VGAHxOJzJUqIq5fWVmee7PFbQ=;
        fh=VnPi2da3+1IC3uN+t6/j8meBwTReR0Hg37EwbhDc3Do=;
        b=SIjh4/AjDXt9lSqol578R9b5xK5FG9k7R8svNl/vfb+avV0zWNzzrlamT35TJ9htq0
         ybr9BZM7HSFPvjWFpNYh0Siloy5yoDi/HkP1IYlcgfUtXGuEX4wX4WSdzrwzr5Al+itb
         gdLjT056xEN1s3pTOPpHBvLBZ55kVec68ir5Gvu2ic1XI2J6jORV7IjTXcRg2/lHG3Yf
         Y9KmySRn1w9pezBpy1T/fN7GJpwOh5rZvM1oHPDC3jXuJMUPtMH1DEJEUtVCAxhFjaHw
         Jj9dXzKC+So69pVb6mVwHkK8ytYG6QKS1kMxAgQiKVKNb2tX3QWY+tJK5YPvgynzZ/Rx
         iZ7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780509351; x=1781114151; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96WV0R1ZRprp/ANw1+VGAHxOJzJUqIq5fWVmee7PFbQ=;
        b=ekKTw3DsgoXWn+Adgb5XMSIQat/PJvWlntM2IXnHd1kGXw/8KuItOFqi+hOd9kQENy
         cOcMRRO0jrxv4XZbM/aJh/Ale1XZ7eBSivgEfhqzq47ZQdYju6I2Tz3OXfAaY3J6I+Cy
         GxURsrSUqu3heHmLr31X7Fg49L6Zw/9LBOecoh3fJtORY3CbuK8blgqk+LhZDNFUo3xF
         FZfIwlolPHTbk9B45FLyutBsJGCK3de2LFjd5KW4yh0rEZhAzIl5yKB8n93KSX5IE5CM
         lOHFwItPp5SdzPi47r/GLVLHl2BIx6L+XdNSqVJbPxT4v9b3rwOZ8GRbE2LXpPkZkVvj
         6zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780509351; x=1781114151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96WV0R1ZRprp/ANw1+VGAHxOJzJUqIq5fWVmee7PFbQ=;
        b=sM8kodgEt9v73f33J0fIBQF8joIHu0roSe6VPFHXE5oehqVz4UnHfpN9uExGAVyBkZ
         hYUVPWnoe4ZTVl54/bFh2DqYewnIKr7yaTrDGrR1aUkQGX+YCbmuHsjHpxlLHFMqjvPE
         5ufi013KlwlGqwrj5I+J7pPlgekgU+OptzMSLJJuFg6g5149S4P9C2VKw6gXIyy2cXPp
         D0ogWLR1LT4UswPOVBEt+39G0p4wVV2knLU5mbyyN65kQilql7A2c60lhMxqDhQWd2Eo
         YlS65/hHO/Kwj7yYkGPwCs8d9QYBxTyKjQj6gfdbI5Wt+dv5jaXxkpKMBkdxD/chEeF3
         0apw==
X-Forwarded-Encrypted: i=1; AFNElJ/E5H1cz4i9vfH12welpk0aMnoRcbsfuVpZW7uk3DTS1XLsE/MEICwRIDaqLuOCP+nAY2zXL8BS/4Z9@lists.linux.dev
X-Gm-Message-State: AOJu0YyL2kil2C65nE4myhEf2+kd+MX32KnhKXk3n+98dsou7auJfaa0
	YCcHEChwc5X0pGMVUJG3gXVqQ/0xLJJYbIbsA83ydGeKy1+jBjdYoyy5wfDTT0yvxTJW8Bk3/XJ
	6Xd0PQKSCf+VCQ0tFrfknGmiwIeUhQnYD+O4r
X-Gm-Gg: Acq92OE1S4oE4Lesfyk0xmw+0QBU2jZ+z8TRzcvIHOPwg0QkQUXzJMV5syLUe33KHHM
	UROeaDAxdO/nwB5S8tXkInl5ou6vRcKmHVfMn/nDFKTIV9s6DWmk8s7nXTH7jW5CLgtxlz23HFY
	d3dRHYaSQf3qvXyBuKlurdQlrsYhINu+FtcTVBaCt7aAs3x7b5VsGTuaXkqCLuyOAfCLVdgPPcy
	MLUgZ6MC4/lNsswOZXFrDK/HFSNQmbzTVknn8g252ETvEAlP2WM1U7meR9LeizWLR45NxNk1euO
	GGINNX4NcyMe7gen
X-Received: by 2002:a05:6000:2403:b0:45e:ea68:5237 with SMTP id
 ffacd0b85a97d-460218e10d9mr6155642f8f.11.1780509350653; Wed, 03 Jun 2026
 10:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601212414.1154139-1-amir73il@gmail.com> <CAJnrk1YGSrEkP2O-JPpie1zqc_5tBH9uHFvMry18TBdCMytNKA@mail.gmail.com>
 <CAOQ4uxjCTCo2SQcuVWt+E-BapjrHWBcqES2PQOcwDFZ+2KgXFw@mail.gmail.com>
 <CAJnrk1auhoGN729ptGN4aF0akoMd+oKebBcK_2QNaaoyu8vbzA@mail.gmail.com> <CAOQ4uxgR=1pgovTY2Y3s3jfaLkuyDspm9AFk0XpDnbJ3uv5cjw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgR=1pgovTY2Y3s3jfaLkuyDspm9AFk0XpDnbJ3uv5cjw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 3 Jun 2026 10:55:37 -0700
X-Gm-Features: AVHnY4LC6T5yPxJKayyPOyHZZTyCYYvSQdQoQZ1Fn6OsNB2eYMdCc2aquftFTMs
Message-ID: <CAJnrk1bqpu7pvX-j0QjsWqGdoam0fm4SmJyMxfK4v+DkVX9-9A@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add fuse_request_sent tracepoint
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd.schubert@fastmail.fm>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 8:08=E2=80=AFAM Amir Goldstein <amir73il@gmail.com> =
wrote:
>
> On Tue, Jun 2, 2026 at 7:27=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
> >
> > On Tue, Jun 2, 2026 at 6:32=E2=80=AFAM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> > >
> > > On Mon, Jun 1, 2026 at 11:55=E2=80=AFPM Joanne Koong <joannelkoong@gm=
ail.com> wrote:
> > > >
> > > > On Mon, Jun 1, 2026 at 2:24=E2=80=AFPM Amir Goldstein <amir73il@gma=
il.com> wrote:
> > > > >
> > > > > This new tracepoint complements the existing fuse_request_send (e=
nqueue)
> > > > > and fuse_request_end (completion) with a tracepoint at the transi=
tion
> > > > > of the request from the fiq->pending queue to the FR_SENT state.
> >
> > nit: the io-uring path doesn't have a fiq->pending queue, so maybe
> > better to just not mention fiq->pending here. perhaps the wording
> > below for "when a daemon thread reads the request" could be made more
> > generalized as well
>
> Fair enough, how about:
>
>  This new tracepoint complements fuse_request_send (enqueue) and
>  fuse_request_end (completion).  It fires after the request has been
>  successfully copied to the daemon's buffer, just before the daemon
>  can start to process it.
>
> >
> > > > >
> > > > > The fuse_request_sent fires when a daemon thread reads the reques=
t.
> > > > > The fuse_request_sent does not fire if daemon fails to read the r=
equest.
> > > > > It also does not fire for forgets and NOTIFY_REPLY, which also do=
 not
> > > > > trigger the _send and _end tracepoints.
> >
> > btw, from what I see, the _send and _end tracepoints do get triggered
> > by NOTIFY_REPLY
>
> Doh! I meant that forgets do not trigger the old tracepoints.
>
> FUSE_NOTIFY_REPLY is awkward, because it triggers _end right where
> the "normal direction" requests trigger to _sent tracepoint would be and =
fwiw
> FUSE_NOTIFY_REPLY does not set the FR_SENT flag.
> Having these two tracepoints (_sent and _end) with the same timestamp and=
 pid
> do not add much value to tracing tools IMO.
>
> So I could rephrase this:
>
>  fuse_request_sent does not fire if the copy of the request fails.
>  It also does not fire for NOTIFY_REPLY, which fires the _end tracepoint
>  at the end of copy.
>
> ...
> > > I had not considered measuring the copy time at all.
> > > My workloads are dealing with other orders of magnitude for serving
> > > time when serving non-passthrough files from the cloud.
> > >
> > > So for my purpose the placing of the tracepoint _sent at this locatio=
n
> > > is a good fit.
> >
> > Gotcha, that makes sense to me, thanks for the details.
> >
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> >
>
>
> Here is the recap of amended commit message if you wish to
> reaffirm your RVB:
>
>     fuse: add fuse_request_sent tracepoint
>
>     This new tracepoint complements fuse_request_send (enqueue) and
>     fuse_request_end (completion).  It fires after the request has been
>     successfully copied to the daemon's buffer, just before the daemon
>     can start to process it.
>
>     fuse_request_sent does not fire if the copy of the request fails.
>     It also does not fire for NOTIFY_REPLY, which fires the _end tracepoi=
nt
>     at the end of copy.
>
>     This is needed for tools tracking the in-flight state of user initiat=
ed
>     fuse requests.
>

This looks good to me.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Thanks,
Joanne
>
> Thanks for the review!
> Amir.
