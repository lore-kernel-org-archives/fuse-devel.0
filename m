Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D1A3D171E
	for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 23:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778887144; cv=pass; b=Shrv7eWIyRLzmAoe88nU0vyZuN7Uu7HkrvQbyYT1MwjvnLWkG1UgL41LnJUqvn8fRzVSs3Z4hXXQQuwvg2gZnl5hn7DmItZen3IIJ6nbB7YACSM/EqVjCOuCCknKGJXARdVOV+ZW5THQDwt63wtvGGy6dZyT7yttwYPkjjnBIIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778887144; c=relaxed/simple;
	bh=4t1qdHjERyEpuXixa9HfcANiAsFz4suKXqCqnhTdTaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rstou+r5vO74iwNO6ECAGdwlVYPrjRQxlk6GgxVVyoLAM6fzYwkiYaMbvw6s8nte2R+TdPRXXFQMk47OaaMKWpvFIYd8saIV30nXhEjxNZQxpJXzS58QZhM9VQMT00X2FnWM4KkGrAJMJ5ZYkKqwqIqCxEZeasPHI/wQmZn09jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7mOt8qC; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7mOt8qC"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so979261a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 15 May 2026 16:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778887141; cv=none;
        d=google.com; s=arc-20240605;
        b=I3VPGYeX0qUg/9QPDBUBjdRyClr1LPWEDRi4qifo/r5ZwpGd53CLBMTJmXKl29eO8R
         0Zphj3u1QWabWpKk6ZyeJDhxKwB602erVeIMS+G2M6fM3YE2j8vH2Na+qXxo6wSrQA2g
         IFRfaR0g0V3qWgBdI3dQPGWCNCXLgY1Ghn5cKB7RarykK/QjZ3SEd/dXOfhdVsINmLXT
         pTTBWILx2cSS/9Tu809mJ39EyX2jsXKjrAmcYso39aNySLWIncl7toaafe8m2vmjQ5wo
         D0QrzEChVa6gDrmy3dJINnYHMIGV1b44KSU7CCzsWYZSUb+jDh6ReoYJlFMXghmLWGxB
         WYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aw2/ho0S7JWvyYsJMkYHUqFQO42K5fGKmFJEouhlnJE=;
        fh=Jf4BQd+IzOLEo6s9Owa1RmdxhvAAwoze47DhzjuiFB0=;
        b=GKKsUzhor3VS0SwyxNoFXARceEjGjtf1J1dJmpuobR16YG+ZJXHLqFRlfv5Qqh5zZu
         eyvD8UHyKIsMYn/qhY6IABZ6s+g6x+1fVkEM4gZAG5/mk/PM0YuhFE0IRrW7TkQhqlgl
         blRfQZboEJhZYBMBvX7poiEyFCTEB2cig2STphBWAz8FEwYEHsyWVURCVjXT2taDKRo+
         R7XcigHeurZ7kdxN7aUSZfdhcBMt0e700F/QUEsvRVmOXHPTR+f4vSSMjntw4ZuB/9XF
         WQf5DNhL7L0M8J5vov07uXRGqvviVQUTOpeJDNwT7tLudNdFDgTqo7ZvSodlM8rMnjXt
         mZnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778887141; x=1779491941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aw2/ho0S7JWvyYsJMkYHUqFQO42K5fGKmFJEouhlnJE=;
        b=m7mOt8qC7oe4+hEf7YJdZ5XHIfIhIYPbHky0Q7nWj3DPoVStVEhiNAAssJnD5OHUpe
         96iBFjLQANsBQj1cEEJlrTFMsKRMFV8ShK+ae4ftTU1p867lc9y2xUkIXF+l2Vl5Ihaq
         secZAT14qah9lAKKsSJURdreAphEtby3hZm7AXpBf2PObuh4yjTr8W5C8HdeYXohjDcC
         XvFJMPUwcJJ3Y8kQtlGN9Jt9FW+UpDBeYqYE2EbGlqOTGEAjXs8cGg7LpWAKHCIrKNwd
         gipFNRxxlgBx8LiNbZRjjUR+2TGRhaGp3OhOvQHXf7kxI7RsL1H8kpoIgQpi84R1MGEy
         DRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778887141; x=1779491941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aw2/ho0S7JWvyYsJMkYHUqFQO42K5fGKmFJEouhlnJE=;
        b=gveJvOw4I7h2ix8xTiUOPfeIQ+5bIi4lrWudqN+nQJzVq8LAvOMLGQCfxqruZfNVA7
         M9zFxEtb+XMYtQbKZta1XqlpZQfR+lW/sdFHYYlHT2LlRWz11skmEFQuJw6oomykKWz9
         YhAF+NxnC4Jjw8QOFs+Z4U9pgOOo9fIF7w3QHic//PPTn3aSZkheu0OvDGli6D2GqtS3
         SD1Rr+xj2q/szcx0Q0G+/aPCYjtKZg+thmsvGLjG+kjhs1ADX7NgolfSBPSTMb/EbQdz
         5/bJ/YFcibLm8cnM8ehMxvjiuSZs8nAaHTNC4bKh1s1/UDwv+KJKhswT7Ft9SXS2i3MQ
         rmqg==
X-Forwarded-Encrypted: i=1; AFNElJ+wFDtuWdPGuLc/nh4aukNQd6YW9rxNjFvXf5zcWTw8AwEmltw8vULvy9GmoZRZHwyC8/KYsFbcjK9q@lists.linux.dev
X-Gm-Message-State: AOJu0Yxrwb5YO2QDYqRunJlPBcEALtCIV+gl5IzbUMSxVvnKwXgTnH6V
	p0X9YiexWsstHVnLRz226/2ZFjFjtUEagg6pYuqYMcBkxDVa0mo05hhQHmG7eH7gw10YIrYSJO4
	2g3pMt/GxeFa4+1kqGA9KlXmrQEoPtcM=
X-Gm-Gg: Acq92OHiTFe6Purc40iicKhm7Nr6zmiH1NzJqT5H0wgMDy9QUi3pRymd2LT2QabDG/l
	j9kcgR1OtXVlM+rHyPafF86X8mmtT2T2bpWxn2+8yCCJU+mc35PVnEkiVTPq62zOWMHRs2aaKfo
	QHtmsjc0u1XV+dCPagaXPzmiadINWSJuDvH9amLdnFRFuOdXplowYop76P+N1/MhKo29OaRc7J6
	3urvhJkYTPHh+WqP20F5y53PBJSkD9Y9bGdhCJylsqM8cfwZuVyAgHTgV36N2CYdHoUZV3s5rxj
	oH+reA+Nu3iuYsly3ONqsnzhh5C/J9iQ9Jrj5k3IEQ==
X-Received: by 2002:a05:6402:c42:b0:683:bdd8:819b with SMTP id
 4fb4d7f45d1cf-683bdd884d3mr3074834a12.25.1778887141009; Fri, 15 May 2026
 16:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
 <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
 <CAOQ4uxgV4_Pet0w3f+Sq4kLkvgKM6FyJwZ4AQsnvctC3w=dP6g@mail.gmail.com>
 <CAJnrk1ZvB-R3Szn-VxOZvPRgX_dXwMLouBphnT9_URCE8SxTvQ@mail.gmail.com>
 <CAOQ4uxidwSn69A08Urue7S7n8wrGQcyGuvRL387pD+rpSFP-Ew@mail.gmail.com>
 <CAJnrk1ZJ1pVWn21HZATRes55RJD0F0+6SHbq-8FojPutQTiW6Q@mail.gmail.com>
 <CAOQ4uxgDGuFq=Szw8G1BMuhuBhZ029kf+FrVq6y2Oq+gaQ78sA@mail.gmail.com> <CAJnrk1YpbLMCM0oUWBBp1t-zfwneWhyv35ckc5JeNxs=SXFePw@mail.gmail.com>
In-Reply-To: <CAJnrk1YpbLMCM0oUWBBp1t-zfwneWhyv35ckc5JeNxs=SXFePw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 01:18:49 +0200
X-Gm-Features: AVHnY4Iwa9Vr2d50AdztrDd0BqlZqVpCvmUXUuWFjW2z-409XGfRXr0s0o2IF3k
Message-ID: <CAOQ4uxjFY_Kv4ufxsQx+3NBVMkFbCce_N9LZi0Zzjy9z_nF2kQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 12:32=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> wOn Fri, May 15, 2026 at 1:17=E2=80=AFPM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> >
> > On Fri, May 15, 2026 at 1:24=E2=80=AFAM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > ...
> > > > Cool. Let's get this rolling.
> > > > I need to get my test setup back in shape.
> > >
> > > What is the test setup you are using? fstests with passthrough_hp or
> >
> > Yes. *was* using while I developed the passthrough patches.
> > Didn't run it for a while.
> >
> > > are there other tests in addition to that? If there's other tests
> > > you'd like me to run besides fstests, please let me know and I'd be
> > > happy to do that.
> >
> > Nothing beyond the libfuse test_passthrough_hp sanity test and
> > fstests with passthough_hp.
> >
> > >
> > > When I ran fstests yesterday with passthrough_hp, I saw generic 683,
> > > 684, and 685 (dropping suid/sgid on fallocate, fpunch, and fzero)
> > > start passing, but beyond that I didn't see any improvements (or
> > > regressions).
> >
> > That's the last report I have on record:
> > https://lore.kernel.org/linux-fsdevel/CAOQ4uxh=3DcLySge6htd+DnJrqAKF=3D=
C_oJYfVrbpvQGik0wR-+iw@mail.gmail.com/
>
> Thanks for the link. I had compared my test results against runs on
> passthrough_hp --nopassthrough.
>
> Comparing them now to baseline passthrough_hp (no inode passthrough
> commits) on the tests you listed:
>    - on baseline passthrough_hp, I'm seeing generic/193 and
> generic/355 now pass compared to when you ran them in 2023.
> generic/080, generic/120, and generic/215 still fail
>    - with the inode passthrough commits, I see generic/080 and
> generic/215 now pass. generic/120 is still failing, which I think is
> because the backing mount doesn't have noatime but the fuse mount
> does, so getattr passthrough to the backing file will fetch the
> updated access time.
>

Nice! This is what I would have expected.

Thanks,
Amir.
