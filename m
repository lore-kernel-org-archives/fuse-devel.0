Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC1A43F0BF
	for <fuse-devel@lists.linux.dev>; Tue, 15 Sep 2026 05:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451128; cv=pass; b=QDQgJq5Da34SUEmzwSzhTih769KbPro8aeNzIolHD8hC0SOzyNnk6nuqwPizkaSePwtjPKtHrewtaX3tAwPIoQAhIrbVQ3y5qcbIMKD4CxIBisk8j3wnOYKFIYMrZED+ts2XObW0zavtlGNX+wnPahjin+ki+VsVlvejy69TYr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451128; c=relaxed/simple;
	bh=l5Uw69JZUr1QcSua6I3kTK6OuQTiECTzvg0I4B4pBok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3amuF/iY/BW5EVdyC5tzA4UR7Z5xSl2E9FoZuVWKdxI84D1qpekGaxX/u1LjjrkMPSMVjP+L8j7wGiUGJh4gV7ABzdLK597yOBRjesPNkVFxlwWy766ALIDwzFYhhPy0vMtMnrJhTh/tFvOkCHWcUtpjxRNhsZjNCfXmSXthSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=L1179yD+; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="L1179yD+"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-530e1b6a689so23052041cf.3
        for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 22:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789451125; cv=none;
        d=google.com; s=arc-20260327;
        b=jgCElvwhGRnXgO+6XR6pbpWWC3ih2pJEMIHd6KsDUjU4sXwxaArsNDJsqCN6YLiOI7
         8zIodfFgCMZAuSK+Szc2WO2QTG1JNdX8NIG0QnTtAxYTmI+yvOJM97qT4XPxrnRw9uj1
         rprz/PamXJNzXQ0a55381DUBu6PNpyBTN2V/iP5exvh0yxVNMDwzDuggLoQnkydh1gG4
         1xZ0rTD8PAjLi7gLfF4KJ8D0FVOfPFSdBsfBk21CW1ZsNjwFjwe+aGZTxTvofC6imgWB
         JjfF18QE9p3gAfwMKleg0sOM+A8A+JVJ+9yTkC5Hx6M/qN2TvupcrGjQ5l4icL4ztSqs
         O4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GWxSooxDJrD2T+q4Hj8D1+BEWhhIxIncoIk4y1XYCEI=;
        fh=kC/kwyn9FrtkEvpLKTFfOoXPLZTRBbfJZIbHNAJSXNs=;
        b=lXqLXESa2aspMDybkor6MlmDPeGmWAbxO0/qf/0qYN5It7Nxi+51SzedlpQDphfTfy
         +7oXkyImNBol2mkPsamurd7jp14kOf6bNJnTr/kCJKQhITkQuM+STH6Yoe+T3lxFhz0m
         /TrpfgatJjjdK0Uwhban9AatwVbbMe6LFwkUzCH4qatpIjDk9uWvuUTA6kMN5B79Ocxh
         CK7nfY1XJzqPltgy5Ewgp9INvEr1uKGlRT/UPOyIQ5iztbGNHHuSOwByI5eyWybVy1Oo
         1Ik2WuIicjhcLB0lB6pJCVWsLGwmOlhmbcr93Bu7H/nR6i7WTW3mqO7IseSYg5fQ+tyQ
         N/UQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1789451125; x=1790055925; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWxSooxDJrD2T+q4Hj8D1+BEWhhIxIncoIk4y1XYCEI=;
        b=L1179yD+28Zy6HYjU48KsBWW7Rs41/DYv8yatq6vkVUOaL3dEskQ3Kv9dMEFSG0meK
         LEEnLTOZibpCkcM0j5w22NPnsrPHfTvzy17AxxKbjEC8pxHRQPyMtwpJpJGg/p6CdiDM
         PQrsWW67UewxDhCgi3PUgJ/dlW95IqKnkTMKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789451125; x=1790055925;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GWxSooxDJrD2T+q4Hj8D1+BEWhhIxIncoIk4y1XYCEI=;
        b=fc7x3jTTFa/mJAkk8H73J6EmLBBQgwL15W/6adSmT1IE6C17ywDFpJJIoAOLq/w75P
         +TzZlDXtQhCNeCvFnS/8a7CGyGwJjGW0oUbhiMgz5uvsqAaLzvTTztkHQToHmv2A99CC
         AgzkF2h6OHsg6V4xEYem6bFIl/88Xm/dmZ7ycwfYJedqPMu30z+cmwEeEdn/xD7qelUa
         Uoh2RSIZxiqetLo/sLweTaWlK53EfTl7CnJu02Sgzy7bEFZppeaPXNDjGF1KEusvR2h/
         fC2BDXA32DoHo9WOolac6crNbnId6H4gXjic4eAFjkKnh3cZRRDP0+kkszPF7ZQFk8TE
         mOzA==
X-Forwarded-Encrypted: i=1; AKwUvBzwi0LdmQsARi9kb86xr5yFY8cXy+IrmSLWmlJMqSoc8cmbDQwZWLDR9uH2d9qKFh/bCaNLpFXWPWb1@lists.linux.dev
X-Gm-Message-State: AFuF++lJGkLB3A1+G7qlPmBdVRh5bHdiMP1ZaFdgDYdo/fhL0lA6CuWx
	Br+f3hlwk5iA+2/PgwhWnt2ch9fTxbgcdjwC96SOsyjASv8eMCXzweBQxrFRoxLb7h8kqmhrwNu
	Et03A/9Fp08U21dMq/H4/nb3NtB5vsA8EaLz0+7I05A==
X-Gm-Gg: AYBFou3ceAqPA6sqQhxxHlP1XLqj+XgFIF8PJPqc+o0dBuQ0Iaa22Pa0HEuKYOWk/aX
	7YkWDNRa3Ij/8I3IfSNuKGPBBGr9mlYzSMSFqN3fn1f9fo0Et2vzIDHRXwM0k5ju1inT7QBD1RY
	Ijmy/3dXuzR0BmWMSsrRYQluNJEjNmZazopKP3pE7lvnOW5CTkKtcTod0OsSJ93QcOIxxGZKesl
	8s7IGhNoJPkGffFq3+uJPk8nEo4k/VBDRNrARcD5hXzCCm7O43HaRnEIZaUIVs52j6Ivnw649xG
	vPZbu4OcsxT9ZdaEITYHL6Y5ONWIh5XNDrugAtPNBs+DDYJwSSiwg5CJjOPaVCW7uk+fVFuxABs
	iF/GS3oWvhvgi1djkGGqz
X-Received: by 2002:a05:622a:507:b0:530:f73a:90a9 with SMTP id
 d75a77b69052e-5310d071109mr84282011cf.53.1789451125103; Mon, 14 Sep 2026
 22:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901213412.1763253-1-changyuanl@google.com>
 <CAJfpegtWYP-q82428iHd9gOBkAmoB=mgfGZRs3oi2FiAm3W-yA@mail.gmail.com>
 <CACGdZYK7wk0fMz7v7K_HSBfJvOYRmpWvaeNF8fBfU=j041gYuA@mail.gmail.com>
 <CAJfpegsWp-s1v62mwhafAsGPXsP_aEPTgG_FoOLHVmNeWtevHw@mail.gmail.com> <CACGdZYKVz+0mrOuh2nyu2-jY=JXY69HbR=7PP_UHG5F-bB=-+Q@mail.gmail.com>
In-Reply-To: <CACGdZYKVz+0mrOuh2nyu2-jY=JXY69HbR=7PP_UHG5F-bB=-+Q@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 15 Sep 2026 07:45:13 +0200
X-Gm-Features: AcwNN1XUPy7cho8LCyUGl-U4hP73_j7-zlZrh9pWB2G7CvtlMUD_1OKksPIyp5M
Message-ID: <CAJfpegvK6_Jz4tUcguaFo=R0ZzG3Lg7TOsJmvFnMN_+Jyeii6Q@mail.gmail.com>
Subject: Re: [RFC] Handling 0-sized pseudo-files (cgroupfs/sysfs/procfs) in
 virtiofs and FUSE
To: Khazhy Kumykov <khazhy@google.com>
Cc: Changyuan Lyu <changyuanl@google.com>, fuse-devel@lists.linux.dev, 
	virtio-fs@lists.linux.dev, peternewman@google.com, 
	German Maglione <gmaglione@redhat.com>, Hanna Czenczek <hreitz@redhat.com>, posk@google.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 00:01, Khazhy Kumykov <khazhy@google.com> wrote:

> I'm not sure I understand the proposal here: the guest kernel doesn't
> have context beyond what we pass through the inode lookup, right? I
> don't think we have enough information /in the guest/ to know if a
> file was a special pseudo file or not /on the host/. I might be
> missing something...?

I mean the host kernel is in  good position to give a hint to the
server about the semantics of the file being served.

Thanks,
Miklos


> >
> >  - file is normal: POSIX semantics apply
> >  - file is pseudo; POSIX semantics don't apply
> >
> > The "normal" category could also be split into:
> >
> >  - file is local: changes always generate fanotify events
> >  - file is remote: changes do not always generate fanotify events
> >
> > Thanks,
> > Miklos
