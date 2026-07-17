Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D676422532
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299410; cv=pass; b=qUtF3UN7BCw3bBpiTsLJyEct7Kf6UJG0Uv/cAgzI9CHqsSEGUzRD2JSWqWAKMLI/jyAwgTU3F2T0/5FGEOLZzjyD/xgoX/hizQUtePp2PuhVihL1VSiwbrMYK0CP7oFPUfuPDm2X1CXWdXJ7Nw8sebqSZb67w1jFK+kaQHggPmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299410; c=relaxed/simple;
	bh=xMVbjuxUMCd+in1O0hq2Lo+UksoR1rhO7SpPcRBLhhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0LYU1RR5lX5yiI2BzdBt0t8Y38nPZg/OFzu2EAgZ4s6M+Z1O+AFBWr+8nDeNNxth7fdwHlmSSYObcs02TlkBWEzmRaa/Y/H87gIQCDl2K4T4GqNmDchZRYTn1kLxg7+OiKoNW8G6iEGkvqs4DJoCfTscnWYkJklkGShmP8mqjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kz9gEyXY; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kz9gEyXY"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso11085091a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 07:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784299407; cv=none;
        d=google.com; s=arc-20260327;
        b=BSDhTTmmgCwf82Lw1mqryHgFNDJUnZ7clG0TuYzcIp8R8f0HvVfDWnkt3HezMQ1rm/
         j1tj+8uPpuSbpwiMO/KFNZLecaNOq7tndVCLNicDdqefhLjmVLYlR8NZcEYYCFPK8zUr
         0N9xZsLh5Ds9dvy5LcVjZK8Kp2hrXCBhHYMkZmvQ6pw98BPlhWgrpmnKCRn9Jz5YKwZE
         Myc69lCvcR61Dh9MEyZWOoEmXYrEKZ49cUDz4cDTWhG+1jskI1ziHJe7+UKv8bmk/Mbk
         rpi/o6/iu9n/Tq7D7elOxr7EpMocVOnkN3dRFD+s6UnfA5h7l6LaIWcuhCTA9m7/HWWJ
         HDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lCxDrB3QhKE1++b/RR6ySzQlEZvksrfBn9TZvGZONMw=;
        fh=wQHN+7GhsljXnXjgsDdT8E5eW8auoHPwOr+D2bObRM4=;
        b=I4CE4rWrovztu1cNZzanvLe7ht/CrW1nwfFDJGTSF4249pACVW3/Cfwg50WANwBBM5
         1A80hH4555iRE39ajxAwa02EYQB3kQj9JYcXzsP7FgAgokcBBs0N4CsNgw2WXEUX2qjX
         APRWxQ0jb8KqX9vRExTd0oDR6WWmaEptJHFRJwSghdxyJYnvBO0r97KCWyVnhxeeyyAA
         eXuCjS09xKvkJS8rcJqcEhrWXI+AY2gqN6QDbDND83b3cNN+3whNDHlMwOJJeaXur/lk
         5leIHyIylSlj51JJWGqDmiJHLSblge41n+mgCWBWdTN3+sJcnGmzacIdOj4pUKhIvWwd
         +XcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299407; x=1784904207; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lCxDrB3QhKE1++b/RR6ySzQlEZvksrfBn9TZvGZONMw=;
        b=Kz9gEyXYeHeYKaUeAlt2qK9ifavf4sWt3jk61xHP38eitgnb/F6rOVM0ZbMbYpWBtO
         HmbOfaVXjXXHHc5ezI5QPcXcbNAedyvHASY6P/8KYnQJnCpj66whITLgE7HMMQM9ucm1
         f926zpQb+atirwRW2iImiA4pMNTp74yCIakBvGDBKD5ptpOuJHxW7SHmhY8iw2FIyfAv
         imTDW8dP02CaHHM4YDZ1ixOQBSgCQd3qmAAz01RC/tSMWtlqCqgLc0jtaRmH5z9O00oR
         XKLbB7NwK2QwZPCUu+pTf5n33ZEf/6UL10P3fpt9P5iLtU/VPleu4jwyV4YRUXxRzYfe
         BNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299407; x=1784904207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCxDrB3QhKE1++b/RR6ySzQlEZvksrfBn9TZvGZONMw=;
        b=S7PWpeFJdr5E7F0Qv9uHeN/WIO/ZuFrQg9x/xiwP0dzIaTnVUzQYfJheupQNiXLw8j
         arYlTry1UAtrM416oRcLG3YjNkTq9POV+BbfZm+8MzZi7D8y1oTpwPD4ip7zTkMe+Yt6
         idS7unI01w8jukdpeYhO0L7X1hM7DPltvWnRUcE+SW3e28uE6aMoXvb+xFe29ZEH9YSM
         Yu2D/imvQglG4KXdi+dzkJ3G7KUleYKIggu3X/5+Hp9fXHWn81Jdmw1SESRNtlLTMS/I
         78hVB4c2h947xfkR928NLtGebp3IlyKtVXaiDiW4wjqeL3Uu7hZ0QfvLTl6D+0noTSLr
         WkvA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu9FzOTTCCRq9Nid1VLFty4ztnFRiGgy+/wK1tMxlXWYWsyDW3D+XeHYzPe+yvZXMMNVKkAqlA1+p0@lists.linux.dev
X-Gm-Message-State: AOJu0YxIBnDkO7Leor4O8zZ4aZ7ibtpY5vO6h7m2TDL0aUA2oPtbJn3W
	mhC/8OaxtTwW4I2nIfMvTTZG7GTS9t3D1oSPWAzx6Pt+Ln+tNvhOWjRB6UT0X1IrZ1zdKsY0uQi
	Vu+g5wTP+EYQvzIuL/9oHyeBog5rffgo=
X-Gm-Gg: AfdE7cmSS5fmOwgtP2QV3Vexc7lcrF1EscVf7fgSKDsemZBFg0LuhjnnSHsFsXM3nBV
	1XZGwd1VCqY11e9KZ/6sgKuEEbGCm1HTrQR5ZpiV+9Z5wF6qtU07nJkVm9I/ispwoj+8f/AOSpn
	GpVLt/+tYyABrWbTzeJrR34roSqZ0TRloKFJxwZvwsWaqrU88QqXB+3sivLnMYDrRIfyOPvXuv/
	jMoqlkNNgcTD7h4omRc65QvHjOQwbjAUk10a445QIpDy98VbpDYkog8UWsRhcWpkatUHwSTcA==
X-Received: by 2002:a05:6402:a502:10b0:699:8397:55f8 with SMTP id
 4fb4d7f45d1cf-69e6528abdfmr822443a12.18.1784299407172; Fri, 17 Jul 2026
 07:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701110052.5309-1-luis@igalia.com> <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
 <87pl16c2z8.fsf@wotan.olymp> <CAOQ4uxg-LcCp5_2OGFo71ejJEPc14uL_D6n04jwy3C2GuoWy7g@mail.gmail.com>
 <87o6gp7ot2.fsf@wotan.olymp> <CAJfpegt1ObYX+6+GQ+TcWqnwaYRkzUS_YhVwEN3rLYE0NqQWvw@mail.gmail.com>
In-Reply-To: <CAJfpegt1ObYX+6+GQ+TcWqnwaYRkzUS_YhVwEN3rLYE0NqQWvw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 17 Jul 2026 16:43:15 +0200
X-Gm-Features: AUfX_mzoGfmJZTAWQmNTvy5CJb4ejjS5YiQ0wGRMo3gdzSpICU-wdJMdl09a6As
Message-ID: <CAOQ4uxjxGeGW=ndKTQ7gWr4N2DJLMxtK4qdhXDFQPrVMMQgDZw@mail.gmail.com>
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Luis Henriques <luis@igalia.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>, 
	kernel-dev@igalia.com, Seth Forshee <sforshee@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 3:57=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Thu, 2 Jul 2026 at 10:56, Luis Henriques <luis@igalia.com> wrote:
>
> > Yeah, maybe your right, maybe I'm missing something as well and there i=
s a
> > good reason for not doing it.
> >
> > I was going to CC Christian, but I see you did that already :-)
> >
> > Maybe he remembers the reasons behind this while working on commit
> > facd61053cff ("fuse: fixes after adapting to new posix acl api").
>
> It's not that.  Those lines come from the original fuse acl support in
> commit 60bcc88ad185 ("fuse: Add posix ACL support").

Right.

>
> Maybe the thinking behind that was that the server might modify the
> acl when setting it.  Not sure if this can actually happen for network
> fs.

Same conclusion that Luis and me reached - it is technically
possible that a server like that exists, but they probably don't.

>
> In any case it is unlikely to matter in real world cases.  For now
> let's just document these quirks.

unlikely to matter if we do cache on setacl or unlikely to matter
if we don't cache?

I guess both are true.

Thanks,
Amir.
