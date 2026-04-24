Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE5A3E558D
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777051646; cv=pass; b=Z23+YCPfNPgNmrLajQRlbWnJQ3p0Gdbpv6UozPIVU+OclhduZ2o6JsIiq4opTdC4PQZpGLvagRYe5EeCrbeuqOuPV6qAi3/hU1+7TP8wcTeGoj5UtT7zlowVsBy39Rn+408zw+HBysAJVXXUCiXycDXLCvo2w48iypw+K0pdo9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777051646; c=relaxed/simple;
	bh=GmxzraBXmmXshyLt4izsEJVeDSvlr4JWTWYoXr9HzZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6Ppa11ET8NrmQ8o8CTmFwbtIlT5S5zASPdLX9Vnuc5CNyp/6NhrAF+ktnRszahCsrpMC+K7oLw0b6MdXr3F+FcZy7umtqfv0ZFfjnt/ROqEzk8CsOqCtZiDaOFtgq2J0tR8z+SPKdo3EczCYIS/iijvxQmn2RCu5Q5VJXQDH/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh0JPylb; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh0JPylb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d77f60944so6259836f8f.3
        for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 10:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777051641; cv=none;
        d=google.com; s=arc-20240605;
        b=FjQ8maY4Ix0GDue8Mjru5xt2YAiwtN96pfja99UZB0itEiPsBgVowIHe4+n8xxAfQb
         Rqyv37QLRQ0jXKYdgHHxhwSi+cxisVR1c5mTCIbE/j1q3DEazyydHVoDcJQzOUsornHr
         6jR3dzFOeeH6GP5VY8FFrPLGx5JDFPaP6Ycgd2PlozdPTnmT4mmJKj5Dk/sbHP0CXo77
         U4zCMCSBLN9oFUqwelz+hE43EYGIKLfAJdwfN9xlbKx8d37b3HHVHoLJuI+QOTE/uNrs
         FpO4gnbMKhomZFu/YI0g/3D6YXeNp+3rZDf00Wlaj/uuNLkLd/4Ud8VY7wgs9VQGc5sr
         S4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hzMDWtpPwY2RA4jf/LMDvZpJAV1yzjLrY8/fdgBLoiU=;
        fh=5XXKbA4F+sQ1/9PNpwV4n4QufJuKJUD5ji5KdkS4RJw=;
        b=ffaVyhMTwVRWY7CDSFoXe5jdO9Y6USSlXdQgbZD7wY476WfvMPIx46tquqNcIZYSMC
         v/6QeACgGaKHLQSDrfj1Q4QJty0Rm2UsGpL38hPEreTkNZCSdrFXt1fV3qOFZ4wSk2x+
         JqxjBk4Q/Wo84OEzQToSNgfqSBS3EBtdu3lgHiwWp8mjUEHrkvWN/UYc3/IB23fTsNtN
         bVwrCr4ou65rZ//l+OwM1mgnAJobrOxN/tQagWWgYWouBuBHdv4iQMoZ7XqZuhvbERFj
         ykDENhJgG0Ltwt5KLXvZbckAK1SY2U0fApTKxHc89rbVzmni1bZON91XNNBfxwlDCkQM
         TKXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777051641; x=1777656441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzMDWtpPwY2RA4jf/LMDvZpJAV1yzjLrY8/fdgBLoiU=;
        b=jh0JPylb8fE0ZRJXxOeqbb3DeXl8+nwdXujiYZuxwNqxdqBDg1uzDJDqD3DFzoFii+
         DjpAb9/6HCRRf83geShPYCGrmrl26Eqq+i5wIFBKFBGKaqmzfjc0RGCIhm0JPO+wMbLq
         9ByaTrZG6xIwoDl1rfyBeoqEt0qyIA+Y2+2fOidIyTJwaX45OhUlrYEAr0idJTXEKNxw
         vqN0Y3ASRyL+ZZKwCSdpuqsdU+JS2xiwmqoBQV+NS0XVj/nV05ENHTMpntR9V2M2oztf
         UNYhsaoUnr7TQh0dlLMKbgp7qEOrf/Ng+zQZQD16PlawcVOzT/tP/5xgA2b8WoDFHIkG
         rwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777051641; x=1777656441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hzMDWtpPwY2RA4jf/LMDvZpJAV1yzjLrY8/fdgBLoiU=;
        b=dudRE8O0M+TIEcEAHd3TDz2Ibf/GURSzadW2fDjBxn7gzmZttanqRji103+uKRGFwk
         YBvvrcApHSS28FG260SnLWbDxIKWuKbuBCnvtUPkJmyVq//twxgq+/INn+8EjsQL+ZMZ
         Yd1+LPWXmtjpC9t9RypbL05T8z8nE5+Kaal1vQxq3mp7HbRAFdH3kOnc42iRD0Dso9XB
         JdE+yGeCVczGOnfO7yESR6y7QHa6dxE1q9jwouzk8c+BsEytePlh31auFRCvpLuH4tDC
         Bg0twjKhS9E1AXNQ/P/FppwxE9WdMn2CGqJWsXIsc1Pfdt15g+v5kwdg9WGnLdncwHA8
         Fl3A==
X-Forwarded-Encrypted: i=1; AFNElJ9MpL6eh3AXbIFgB/QHO+ACNZu2cTLyLalAJUgL8KRH5VgBsQotAlLMLjMUfjrIJixqePUBfYrfXMnK@lists.linux.dev
X-Gm-Message-State: AOJu0YyY7Y3ZmUC37OoKDIxKv95H42G/jTJJvF4XRYW2VArEn3VO6N8w
	WMTelMGTrqgEwPSQbv/pGWF57oJCqb4vhmmru6kHFBRTsuzP4Qp6jGwISuafXB53m0lgm6PZYZI
	9k9N67idYln2FMXbUOSxQssMulAHTG7M=
X-Gm-Gg: AeBDietD+631SBzwtpHbFbpS40Zy1Cm7vRbUDgXq8e4hbdZsBug630+fERFex7Twvid
	4oWTdE0UscnSNbaKu1artRZ4QNIel66qy4gfMTmCCtcKVGQd6Y4Zec9PlRBQOZzH5u7yjOfO/dh
	HPbakJ+Se7M8x4KIChNqrhDAROt2fBfV1jukNZlezBdBfvXMqGq2Muu1NlGJGl8+Ao2ROKy48md
	lPqyfVj4LdAKRtM/Awlxgn7MPRCYwPGRvhsv1giXkG7snDaDu+cMasvFDj8QBXuvspVe7y374NC
	AXuUJxrd9NkVFUS3uJmNgqPYtLDsswbXLA==
X-Received: by 2002:a05:6000:2886:b0:43d:500a:1e5c with SMTP id
 ffacd0b85a97d-43fe3e0dc92mr50193567f8f.26.1777051641327; Fri, 24 Apr 2026
 10:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424011646.457682-1-joannelkoong@gmail.com> <aesg-JcefprjeQfd@amir-ThinkPad-T480>
In-Reply-To: <aesg-JcefprjeQfd@amir-ThinkPad-T480>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 24 Apr 2026 10:27:09 -0700
X-Gm-Features: AQROBzBrW7ZftskuHRmLek91XddO3OucVV8OCAdkfWzpjBB3UjeeuIQ5I1rH5_8
Message-ID: <CAJnrk1ZFQyonVO-_wSPgpzqEiBOqTavd2BbEtFh-Aj0_uj7M_A@mail.gmail.com>
Subject: Re: [PATCH v1 00/13] fuse: dir.c cleanups
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:51=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Thu, Apr 23, 2026 at 06:16:33PM -0700, Joanne Koong wrote:
> > Amir expressed his unhappiness [1] with some of the code structure in d=
ir.c,
> > particularly fuse_dentry_revalidate().
> >
> > This patchset is a series of cleanups in dir.c. There are no functional
> > changes intended (except for the first patch).
>
> I think this is not a good idea.
> These sort of cleanup (e.g. removing unneeded gotos) are a kin to
> whitespace cleanups - we should not do them unless going to change
> the function for another reason.
>
> The churn this creates and backporting conflicts are not worth the
> win of the cleanup itself.
>
> Therefore, please drop all but the fuse_dentry_revalidate() patch
> which should be part of your passthrough series.

Ah, I hadn't considered the backporting conflicts. That makes sense  -
I'll keep that in mind for the future.

I'll drop this series and include only the fuse_dentry_revalidate()
cleanup and have that as part of the passthrough series.

Thanks,
Joanne

>
> I will review only this one patch.
>
> Thanks,
> Amir.
>
> >
> > Thanks,
> > Joanne
> >
> > [1] https://lore.kernel.org/fuse-devel/CAOQ4uxgCezMh3jdp519Lp9OZeqAyZHm=
c4Mp3FthJpfXhVoHEfw@mail.gmail.com/
> >
> > Joanne Koong (13):
> >   fuse: fix missing forget requests in error paths
> >   fuse: clean up fuse_lookup_name()
> >   fuse: clean up fuse_lookup()
> >   fuse: clean up fuse_dentry_revalidate()
> >   fuse: clean up fuse_create_open()
> >   fuse: clean up fuse_rename2()
> >   fuse: clean up fuse_time_to_jiffies()
> >   fuse: clean up fuse_link()
> >   fuse: clean up fuse_do_getattr()
> >   fuse: clean up fuse_update_get_attr()
> >   fuse: clean up fuse_get_link()
> >   fuse: clean up fuse_dir_open()
> >   fuse: clean up setattr()
> >
> >  fs/fuse/dir.c | 324 ++++++++++++++++++++++++--------------------------
> >  1 file changed, 154 insertions(+), 170 deletions(-)
> >
> > --
> > 2.52.0
> >
