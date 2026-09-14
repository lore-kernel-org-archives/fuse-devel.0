Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91403303A35
	for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 22:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423267; cv=pass; b=lpySkYeMJ4baRo0BUMihg6H0YJjXmZ/rqs8mSrajNnxbl3ojayB8Z5FzXiajOji5IUwGS4A2g/Xh7eslYnv6Ejzh3Vq1w6XNHri3t6RWke0F9RcgztRBm19srPX5qBp+Q8GgVh7Lh9qX8EVKAcHWdgENqMnfjumu0/OMlT2rpiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423267; c=relaxed/simple;
	bh=u074ZkJrbh/sxcHtumlTwM+gkaHZ9o4Ni2U3r4twwug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbBOqSDDBh3k68AL44qO/NmjpUvnpoRw52qYQfYVQWsZvtlbisZEmLQEsnrQQt1tHz28plFwcwr0ESKUoag+VuiAtjeRP/WsHc3HrKHHYkccwcnazUa1u0vg438+wBs29fJbCA+ln4B8LvvWS3E3sUd42NBi88PGLtty6DV31QA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yme6sQJB; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yme6sQJB"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so24031cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 14 Sep 2026 15:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789423264; cv=none;
        d=google.com; s=arc-20260327;
        b=KB1Vg5VcnxlxZwWXQ55aomYE5LOypkhZ6zxmDcA9QfmO+LpLAd+zpuUJH2AEgB6w7W
         luTbHu2KwekotqdmpY8qEEMa8Y4GJQhxr97ss59aNIGnIJKBowHdBXxtTt4njJnfcb1q
         bFBPlmByjYe0yO0QmGJQja8U7P7cA6foR2R3grz2fxLlYPIcTsQWk6w1EmGaJHhKGKCG
         uy0w7wf+CnwLotkjN/qjcXso2pVFFW7FoL1wRHiMwnjB20mBqdeH4YRfE1wtEVJDSU9k
         9uV72B5ucPZJ3i9an6IpDV88YRZFwBFRNH4TKBeYJBnk1syONPCoc3SFqhfPxOpNJjO8
         toCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/jUCnXWS5HMAcD9KVLzpXLWgp/l50UoHWvAneYo+hEo=;
        fh=CBoaYroYsoeZZubtOhYdb9BpTStKc35x8c3mI5l93Hc=;
        b=M4ZghlZUzN0v0r/8pSIJHGenspuC3OfF9GkEMqzAwfrUr3rNYRcy2v76gJujw5To8Z
         gFXqVvh/U3Ee9Y45Hev1uCKBWqihz9biWGErBS9Caean5gQYq+4iiZ9IKv+0h9tUNSYO
         mSTa8JszSW0PN0uYC7vY9t8b0WqFcpVyZ03/qQVcq0AC+PIMRTm+ZqTGnvvFgUQTL8IH
         V+hgkv1E7FyL5xrgXIoTFZBwidBdUuQjMgWwzUbnkxlWK8+wyfMDsT/SO+vhLODbPz7x
         5c9pEX/npAVQab1rw16R3voTv7Xy8lAIo+oOcAH0Qo75Zud0+2DJs9xzW2n0knS0PTce
         JbKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789423264; x=1790028064; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/jUCnXWS5HMAcD9KVLzpXLWgp/l50UoHWvAneYo+hEo=;
        b=Yme6sQJBsi82B2nSKvArl97+13Oy9CMkFX+vWT/pmRlpyYOKFxX19u9OhR8lITNJGi
         eB80nO5qjfSw2QWfrayywb6jtk4tiRKtEbC/D7VfnwvjB8BKraQgbWiQ2m8hF4HJX163
         5yzaqNrfxQuOM7Ov8rZmkgs8PhN8+RNkHBGNFkM+xocvZntWYreaSJkriV71pWU6d97F
         ehOpKy6dtcYT6xo9lnC1FtSwNgYoUtenmmrxLj6GwXNhuLPQX+sdOES0Hd/UZEoSNBkv
         MKNyHSnO97p110GwmUh+s0Y8+F2q2smlRmfI1B0c1RIKgIuOTS7OEJaCaN7iAndwh9Vw
         PckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789423264; x=1790028064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jUCnXWS5HMAcD9KVLzpXLWgp/l50UoHWvAneYo+hEo=;
        b=VyHRvQwgEmzrzCjYDStitybHZbC3is90DiDOzi3d8GqgYcFepmFpCCZx8ad5N8XDi0
         rIFXmlGaCtuR10j8paqo6kS6PIeQV+NcedKtw2MpiAG1LRRugAUgPKJ4Ouzkd87XWwBU
         pmhWdhu5zB5I3Zrs/1s20Pp8+lryTIaSlGEV7z32VvS4mtUo2V8vxG2C8Xq+Ok/P5fGF
         0wHROFYIY9tmd/ocluq4PVt/eUkP6PRq7FHUTQvRqubF9R3ME/X/V3ozQGw/eoG9qaAt
         kvLMLNQV2MfUGLL6FZkU7ZVxH1pPOptzphc4F/5lf8TKjMwHfHG9cPzfcMizv0qb8ShF
         hK2g==
X-Forwarded-Encrypted: i=1; AKwUvByZHVvf6dcftmLNdyvI0TEP1SITuIW+kepS+/7jvopD99/uVZA3JndYnR2w0vCWcrqe5i7NDrdC0pA6@lists.linux.dev
X-Gm-Message-State: AFuF++llwzkFLr+CGtkkGPckdLlURLngYbqoXTHVi7dqOPYH4C9NFqLx
	J664e0oLfbV09mseCFgkbu6Zn9HmL1Qjc4Qrw3UOpAVMRV4i6Qe5BKNVnxDMWsgkBK4Z3Z8GlUR
	UDDd2NjBEKHcOLDNn4tq0yAl/+vfO6xWxi78A7NljPCpmwz0IpHp8oxKw
X-Gm-Gg: AYBFou08kM7mpx/i+1rbf5/2Ze/5GMW7zBqj+gfP6X5T54UuDAJsf8wY9Jd+fVvSg36
	BEX6V9gAf/6/nw0nJ/gk8WVoHQf5t0hbHJoNQ54tXz6xQqPwgjnsLvg1bqc9uFBB1ZQcz44AQtb
	goOuZu6R5kneGmDapmwKNeNw4pVREf4Rbbzk0zRBibNSCY70anFtP4guwOad3HWKgsd+pMLo4Tj
	C+KtgyNk3N0LQd0LC13TcixuoPwgmhjW2Vuj9wY2elecZS1wzzJYoS2epvyyeZoB+GLNY//6FOu
	mUzm7L8fUoOlmMsZ9shH8t2YS6jQxhXj/KtWIBF31n5PsY3510kr2Rbjg/Q/7y4zM5Qm2t5Oiit
	HBYlm4JMjx3JTB5UZHjpZdZA4iIWfpcukWJARMmTSPA==
X-Received: by 2002:a05:622a:144a:b0:530:4182:5a95 with SMTP id
 d75a77b69052e-5311a5ea835mr1388571cf.2.1789423263806; Mon, 14 Sep 2026
 15:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901213412.1763253-1-changyuanl@google.com>
 <CAJfpegtWYP-q82428iHd9gOBkAmoB=mgfGZRs3oi2FiAm3W-yA@mail.gmail.com>
 <CACGdZYK7wk0fMz7v7K_HSBfJvOYRmpWvaeNF8fBfU=j041gYuA@mail.gmail.com> <CAJfpegsWp-s1v62mwhafAsGPXsP_aEPTgG_FoOLHVmNeWtevHw@mail.gmail.com>
In-Reply-To: <CAJfpegsWp-s1v62mwhafAsGPXsP_aEPTgG_FoOLHVmNeWtevHw@mail.gmail.com>
From: Khazhy Kumykov <khazhy@google.com>
Date: Mon, 14 Sep 2026 15:00:50 -0700
X-Gm-Features: AcwNN1UAZX6HXGRkfXXv8pnAk8GmfsbACR91va4FlYm2LZCed6LJBVPYR-pRLqw
Message-ID: <CACGdZYKVz+0mrOuh2nyu2-jY=JXY69HbR=7PP_UHG5F-bB=-+Q@mail.gmail.com>
Subject: Re: [RFC] Handling 0-sized pseudo-files (cgroupfs/sysfs/procfs) in
 virtiofs and FUSE
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Changyuan Lyu <changyuanl@google.com>, fuse-devel@lists.linux.dev, 
	virtio-fs@lists.linux.dev, peternewman@google.com, 
	German Maglione <gmaglione@redhat.com>, Hanna Czenczek <hreitz@redhat.com>, posk@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 11:02=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Wed, 2 Sept 2026 at 21:35, Khazhy Kumykov <khazhy@chromium.org> wrote:
> >
> > On Wed, Sep 2, 2026 at 12:46=E2=80=AFAM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> > >
> > > On Tue, 1 Sept 2026 at 23:34, Changyuan Lyu <changyuanl@google.com> w=
rote:
> > >
> > > > 1. For virtiofsd: Does the automatic detection of pseudo-filesystem=
s via
> > > >    fstatfs magic match upstream expectations, or would upstream pre=
fer an
> > > >    explicit configuration option (such as per-path cache policies)?
> > >
> > > Why not just set "--cache never" for the pseudo fs export?
> >
> > Enabling caching does give a pretty noticeable performance improvement
> > for those files that can be cached, and we'd like to have just a
> > single export instead of setting up multiple and assembling it
> > piecemeal. (To this end we do have an out-of-tree extension to the
> > virtiofsd-rs passthrough module to allow changing caching duration on
> > a per file basis as the protocol allows..., been meaning to start a
> > thread if folks are interested in this since it has proven somewhat
> > useful for us now).
> >
> > But I felt having first class support for this felt more "right" -
> > enabling caching shouldn't break reading of certain files, and the
> > server is in a position to know if a file would support this or not.
>
> I'm fine with this.  But virtiofsd maintainers will have to make a
> decision about merging or not merging this feature.
Ack. Am hoping this list is the right place to get attention :) I
tried signing up for gitlab but I think it very much does not like the
corporate network here -- it was asking me for a credit card to create
an account (!!!).
>
> One idea that occurs to me is that the kernel is in a much better
> position to give a hint:
I'm not sure I understand the proposal here: the guest kernel doesn't
have context beyond what we pass through the inode lookup, right? I
don't think we have enough information /in the guest/ to know if a
file was a special pseudo file or not /on the host/. I might be
missing something...?
>
>  - file is normal: POSIX semantics apply
>  - file is pseudo; POSIX semantics don't apply
>
> The "normal" category could also be split into:
>
>  - file is local: changes always generate fanotify events
>  - file is remote: changes do not always generate fanotify events
>
> Thanks,
> Miklos
