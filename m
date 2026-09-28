Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C414249B454
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 10:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591943; cv=pass; b=I4lq165cuX6qrbHA2O7aIcXAcHfbi5CWgpqYQU4qEj4zh0SNg7C9OrkaKjhU82R6YBnTefYb+UsT3BwnuK1lL+9zNvSM386oEfYHFssZXITzmMw3RbqSyv4UNjrszd7W+Rjvf8ObRwkHKdaSoM1RQIU8TLevqz721/qUjsle6tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591943; c=relaxed/simple;
	bh=Hv1tTFEwKzn64h8VXcnTtzah5W49dICAkORgE3eY6lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2i0fbIr/+gPn0GjcgIqG3V655Qq+/s8nqrbc2BV4Q7RcFFFyavL5ABc1Vl/tXTFeKDN6krPLZEZ/y9aFxb4mdp0crX3tW3D4koeAxPpKNkrpq8MSILVk6aIOxg/XxhK8aaqlvX98D+u92nqAi7TTYSsD/AZVXhRpc2Zl18eqpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Ja3f5T5/; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Ja3f5T5/"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-53325e1d289so8915811cf.1
        for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 03:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790591940; cv=none;
        d=google.com; s=arc-20260327;
        b=KXKMOrRaASpc/NjdwlGjCm340X3S+YLIXhdXTZ+Xu/OBt3zo330nsYwnNd3yZ8cVA8
         FbtlfbpIgorLEUSCyvqXsz2has9Qb+CJMwbhVVWLPxbVCjAPq7vb/PtS/grlMXbHV5q1
         uiuxCmXqI5ZJ2UrhUKQi15C735rxOntK3Z/PkS3ZfYzQn9U830Vzgm//TD8a2XjQ1iFs
         07ydx76GAbHGjmQ5o0hw0rg0aKXKVfyxDNaxh/VbX3JNmXK4t1aM6EgUtVpMM65OI9tF
         v7Vq+CTJ7XAZ7g+rr0OaWMdD6+B/7H5by4UiVeC33+C/rAv0R+S/DASaDWU7p51qEL+q
         +ZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfjX/U8s4osLV27icWmPqx1/DDpogKNrt+aKNvrdztA=;
        fh=Rbvjiz21SEdkkUqlmJqxeAN5GKx3ANVwoB8aqOKJXU8=;
        b=kXEJi3/+5g4Z8NmIRD5XPbaZ1Ul0LmsQ8ye5toM0xw1oLrlY9bN/90xPo3wfcM3lY1
         b8Yl61iWLSxbBfyEk7RqA8iz6G3zkaU3UPrRO94xCISdOR+ev+zw0BHJyXwf48b+aGSe
         1ESqMQc1Pbg/P7miAtk5X6VpuadflOQvhpn0OBD5+jUEq4IeuMwQRG5RoKNRMGhUbXLj
         B9ng9dNrYnAfvGImUjSIzvgsPsDK9gBt+pDYrOczfPkgYFJ4aI0SrSWIEK7hxQzUe9tj
         lrvkiWlUwncuQ7djCNcLa2GXc+q0ITX+Nvla1R+Le0MvxXLdxudlxlTcJ+Fxgxw39FUJ
         UdXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790591940; x=1791196740; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfjX/U8s4osLV27icWmPqx1/DDpogKNrt+aKNvrdztA=;
        b=Ja3f5T5/zzHognT35az0tfOuf+NRIazviH/S0Ed+XuxGkEHc9NTWA/k/pJ9f6PaAj6
         UA2V5Q/xR1tJG9Cdq+31v1dE0JA/eVrW0hrP/wwFbfzdvIpFe0LcuKGqYWr+Yu17cVMb
         5/M4Dz4C4Smy71dqxA2oXprKxPS5bk0jGL+Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591940; x=1791196740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfjX/U8s4osLV27icWmPqx1/DDpogKNrt+aKNvrdztA=;
        b=Vm6QmE28m/QMP5phMGwDyr91PLsP4RMEK2Nhy0TH5IpAcRkDKhekn0XL3bxeg38sZY
         w7/8RMImzrFLnm7ih/HbLS82GKCLyqCHWM9gQHTsgWqcig9oTcXu3EW2HK3+7H02Zo2J
         9uSPEBOaPMUQRDac3mNeuXcT4oiE/uDAdF5PpaFTvM/6/vJogkpJS6fTMcAmLakabf8a
         nLO5izQtGdC2iI7I3qQktrbVveCqBkjIf705xmC6ncEfV490dYodwSTG5GOUBM3USFOb
         G2vno7iaUOlwT+tMH3IiJuIjrPNnFcsw76nkDW+reM58rNy97FHSjPcIcsVnBFeP6Oi+
         bpKg==
X-Forwarded-Encrypted: i=1; AKwUvBzv5ZoUPG24Z3ZFzT8q9ozzhSS8rkt5uOhd5AM1fuMiFYdBRCMfnosaa/YWP8NNcw6K+cmn0u7yOJxd@lists.linux.dev
X-Gm-Message-State: AFuF++kpM67jdEN6D/bpnX2KZc1MIoDxIt0nQwEkwzVfUz1x/lOQPFX0
	OhOqF/vXmcHz61+sQkmbIQi/cIhdOv+JUtnPt8jA1mxQRM/UNavJX3Z0adrz3PwNtq+UTpaz+AY
	ZpdVrfbLMqNJz9rYqUuvkxkGX3grFlBA9UCHr6dnWNw==
X-Gm-Gg: AYBFou1l27tApnYa+6BOy6vTBajohryQR5N0AGJdHOpzy6NH54YmdiIPV6xgiBqzqcL
	b0B3R6Aj6OPlKm+HM+9/fQrcbI9vvFzUZXqUKX9bzE2TSlyw+4hzWtO9ubNcjMNi1RL5v+jILcp
	EuAvra/8CjdL6djdd32vvWMeALyg0PaUBu7rti8KAh0uvUpO/aEFdEfSq5rJLLYfTrwhL5KJ0FZ
	DYsIRdKhIdhH2IC9ZxSTf87Vs3LoX1VdOujZYZRCeuuBMsuYRl0EthZP0cM5wnIt1J0GgnI+MoD
	538dP3O8wQ1nVCBOsyQGzDcLLQIaVI2vr0+of7b8h0aQkoy3Te3NLfFQZUABCImS6yo9NcWbZPf
	mIXH10REmEMdByN9egIiksQHU
X-Received: by 2002:a05:622a:1450:b0:531:26d5:ac3 with SMTP id
 d75a77b69052e-5330b5abf1cmr201527571cf.5.1790591940666; Mon, 28 Sep 2026
 03:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-3-mszeredi@redhat.com>
 <CAOQ4uxhKweRcDVK9da5KDCHjrdmpAh5bgKGbL=o0YPoedCx8nw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhKweRcDVK9da5KDCHjrdmpAh5bgKGbL=o0YPoedCx8nw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 28 Sep 2026 12:38:49 +0200
X-Gm-Features: AclHuK-Y0aBemd9VQlEVtGI4eQvmfSI7L7wpXqU0n8wJa29oVe-2nPtrb5J3rfM
Message-ID: <CAJfpegs6yKUnFuiN29hRWCBRnnZ5C4YyD7_JoUrhYmLJMR8rxg@mail.gmail.com>
Subject: Re: [PATCH 02/11] fuse: use "vdax" naming for virtiofs DAX
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Sept 2026 at 10:47, Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Tue, Sep 22, 2026 at 8:10=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.c=
om> wrote:
> >
> > We are introducing DAX functionality largely unrelated to the virtiofs
> > code.  Rename dax -> vdax for the virtiofs case for clarity.
> >
> > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
>
> I am sure it has crossed your mind that leaving CONFIG_FUSE_DAX
> all over the place is ugly and just as confusing.
>
> You may want to create an alias in Kconfig and rename the checks
> in the code to FUSE_VDAX:
>
> config FUSE_VDAX
>         def_bool FUSE_DAX

But then the .config file will contain redundant info and be confusing.

There's a fix for that:

config FUSE_DAX
    bool
    transitional

with the only drawback that now FUSE_VDAX will have "no" as the
default value if old .config had neither FUSE_VDAX nor FUSE_DAX.
AFAICS that's not fixable with current config engine.

Anyway, that's a very minor issue, so I'm going this route.

Thanks,
Miklos
