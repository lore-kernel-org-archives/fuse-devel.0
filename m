Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793218707;
	b=TGg8mW6/czDVL4yXb8z8Oc7x7GvPHC6jsG8NfvnvkrVeEGYNpZzFQ09yzAnDKQO12gLa
	 ZzbOVqkAlFMtvECGpusHJsdOMuDkAKN6bFQxAn0aoIdYDOt1BFHh2Z0qdTzFWu2cLCjlT
	 +BUS5rT9cPYnP3Xr/GlQOLxIIiQueC+SDLHnHdnHjyNxd1IQNY+nzqu4DodJOgAF4cc6Z
	 2BcheoFTiIcixSoLwVT3gtAXTdc3+rWAHeQR3J6tUsMuQpLKDUMWqzHBh2UTdsI3CJqOx
	 BAMXFJFr3O+XbppUUBlCLfENe/abRDkz9R5VlEmhengEc5z5d3Aa3wo6cQIEgw8w0Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=haTsWYGqSxWMkieK8rbcq+XE1nCHwSHXpqJ+xKDJjaE=;
	b=JRzQhcpP0DQQ//AWtJ1yx6oSil9ssn+RWQKIbtPO0haT8iEMUy0EAwx1hoMVYujRLo6D
	 P5l+BvfmwXGhbfsx9PSeNLHUfV1vUuKjoJLYfTq5dkiz1G4E1k+2PHYlFq6VoQiTh7VjI
	 QWezv1IE1eAoIv7zmE0XCoxtAsYKt0R1bbxtFkh+2yElZ4j9WrGhbde/dEsSd4A9MTRL1
	 WVrew3IDPP+Z4ppXZFgB/3RVGk1dN3Xu43gi8i7MHHQt4MumrUHV1rQnSgKLQnZafjwmG
	 +Sns5LW0P1NvkGKskup53+mUnX8erYnIfvXhvXwrW5eV/qY/RZ6Ek47aOuxz30JIF8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WqAwbJ0b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526F8606A31C
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 20:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WqAwbJ0b
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b05bf699easo15019107b3.2
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 13:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793218706; cv=none;
        d=google.com; s=arc-20260327;
        b=rcJkyb32q3zZ4ty83ah+ZTrjQE+KVBXDg/PiAddxEGT9QZKxHAzG8Ae+P6wqPMKdaz
         CBRuYVkbf3jFi8HR1W/1WAIwawa+XRA/Tod/TGglf3fS1pTExRrePSlZcXx5GTFL0d7k
         hCMNipF8PcUmoWBEbZlZDetB19v/T5FMoF+fW7lp/oYAIsnjCT1e4y4kw7ris9wA3b5Z
         5Bz3JuLbcVtQAyl/XTL+mytTSU4ul/QGU2v/WGauy2arefXUo3hT4qMreDDfp+uGBBkL
         ANoP1QekBOK8T1efu/OJSuDq5IGcyLfnKapt2wdlZxgr4ibuuf/dVNMaN5v/h9sUeTLV
         5qTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=haTsWYGqSxWMkieK8rbcq+XE1nCHwSHXpqJ+xKDJjaE=;
        fh=f6JamL5VaTiMv2gFMXXsCkzoN/V3NCLVzd63rytkKOs=;
        b=HlnevDGNUM3w3CBgRb4LGWD3gj781sFpgKHzjmy1Q5mguLD3tDG/8U/jRNK5adApHG
         iMayDujav0E3kekCTfDzHuTuthz6R3I0Q8tsS40Qi/D0cPPc+aTm8qRauyIjIzhFhY+X
         MzvPCCXYcvZtMT6qaUGjcZeAsvhMgulJ5eNFydc+qiDjNpRuR0aa28v/VDNYJGSEqFVG
         cVk48es27+EpuUGBbQmtHy0DpGSZSg4gtLdBdeEbbnrxxhrVre/J5jk31ABLt7jmfkkw
         Wbz/xzsykCuE56H3phm7h4AZE5uDBuFe/pfS6A1OVmiZbNR4rLkPDUwRCZqVwG5UTjCS
         uyLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218706; x=1793823506; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haTsWYGqSxWMkieK8rbcq+XE1nCHwSHXpqJ+xKDJjaE=;
        b=WqAwbJ0bCMT5QMOD8DKqvvyrJNbF7CQ+1RvePdgqWOWU3PXemm5u/al0sUj91hLN7r
         PiWv7t075JtvKfZUGEXOhG8K3nnvAQicRlAlLoehDGfVael9NFFK/YM7o/CzNIEIrmMN
         p0PMIIJWzYGlu+lJ21h/d6VTbMjU1s3CIhcX2Mw9WOhjqwcl7QO9pUk09oA/2e2VP9JZ
         ZgrbKQLOkkcxMEyvLsgPdvi2UmShzaIlVyl9K0kW+LGYa0LAnhFdffwtFooq3tXw2i9W
         GWhbnmZhLc3Mdt3+a2OZMS2FT7NRQA4SqR4C6FpDy44mWFGNHs6h33+yCR2LT4TLlVq4
         1siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218706; x=1793823506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haTsWYGqSxWMkieK8rbcq+XE1nCHwSHXpqJ+xKDJjaE=;
        b=B6wkgczlBbMufBZMLnEXl6H31USR/GJSYF8dlHsoLNgTl4fnOcPvgjT+YSUUpV2hsZ
         96KcB5vzr51Yfeo0AwqP5vGHXPVnOqwslROjn5qq0hvwIX2Ihe+NcTToShSx2Hh0J4Ht
         rT6oXO9Lk20nuAQKog6rfNzBS0ZPCnnHPU+FaIneXBAQ/dELd1nbvEZNm2wkdgU3haJc
         Y43wiL4UuSBkEXILjCehVOyBiU62riR7HsGT7qMgPmrDXI7Sg6cYHKczqD2SnMQeURmS
         4F48Ubvex2yQgpLwolINwW754zP1YkXOGc6j4+SWqnDBpcrhygFaiIhKIVkVwaJZ4nvy
         azTg==
X-Forwarded-Encrypted: i=1; AKwUvBxMNZM7jbkEITb0lLdWT7gyq/ItYpltxjye03FSSR6c1rCcXojs+g9xGJ6I/vNatgpl2ml6+z2xcbRR@lists.linux.dev
X-Gm-Message-State: AFq9FYJDAwJmCpDvvLyGOMMri8uf9Rni9ImGDBFBq0UqJI3gSLtYNw8Q
	nOa2HNjDarnvBdn2GjD1O6lPzMbJkD/C74ifM5e8YRd/HKmeSre8idE3PP8ASrpvA76/Ox5Vyd5
	3RhXPAbPLTq5u9Y2u+Vj88tVixyHmzUdr8xFm
X-Gm-Gg: AYBFou2QwYz8XTgwdRtb8Vqih6J82hMfZF91jER+PjadXAGgX8DXDxGIk3eiS6aEhhI
	Mdb15aePEzoCxXWstCG/DZt2Doiip3gFjDmVbeu+roAN03HBuS2q/Q/H8RRuCSOLGKey6J+Rfru
	SqlM3L6yj3sKremGgB3nlxjBhH91DWnqoTbCeJ1TgTyKQLzOENsbDz76zch2DZyWv2TbxlyEh5U
	R2x+LXj5SKRwnxvyp/0u88S7Guujf5wq5rpxLyVGvf0rbqkI/uopv/8fbCeiOnVlULi1BhuqkvB
	KZJLSxLPFm8juVY5FHM0KdsUp//poN1rHPPghiPpYe0gT7DqotIHtjOnp7UN3+zXyFZYBCd1U6T
	62m9FKmsFvW1ggYFqbALrsssrwlC3d1+tlWeYSs0WCwjPxdp8Zk3Ll6O2VSkrtM4ftAgjcPbPk2
	tolngIfisMtce3o4jEkg==
X-Received: by 2002:a05:690c:e296:20b0:8b1:567c:e7b2 with SMTP id
 00721157ae682-8b1b5cdfe0cmr17642367b3.39.1793218706306; Wed, 28 Oct 2026
 13:18:26 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025-reduced-nr-ring-queues_3-v8-0-8a2570e8d2a4@bsbernd.com>
 <20261025-reduced-nr-ring-queues_3-v8-3-8a2570e8d2a4@bsbernd.com>
 <CAJnrk1bndy_31eJvGDg_84HxV4XDqcypbkVbkFGLL3=EJ-_6zw@mail.gmail.com> <29b936b3-759f-48f4-9605-974a7cde9b37@bsbernd.com>
In-Reply-To: <29b936b3-759f-48f4-9605-974a7cde9b37@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 28 Oct 2026 13:18:12 -0700
X-Gm-Features: AclHuK9LcD7koqHktbMWPG1E3qvYDdkTT0AklY65AUDCmGCfKFUQ-3O_FLbCfYY
Message-ID: <CAJnrk1ZTPPXZUUtwEwqZBNSCLZe5uKrmMiLJO=dE3SU2L_D9Gw@mail.gmail.com>
Subject: Re: [PATCH v8 3/8] fuse: {io-uring} Add CPU to queue maps
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:23=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
> On 10/27/26 06:58, Joanne Koong wrote:
> > On Sun, Oct 25, 2026 at 3:29=E2=80=AFPM Bernd Schubert via B4 Relay
> > <devnull+bernd.bsbernd.com@kernel.org> wrote:
> >>
> >> From: Bernd Schubert <bernd@bsbernd.com>
> >>
> >> This is a preparation for a follow up commit that lets a server regist=
er
> >> fewer queues than CPUs. A request issued on a CPU without its own queu=
e
> >> then needs another queue, preferably on the same NUMA node.
> >>
> >> fuse_uring_create() builds a global and a per NUMA node CPU to queue
> >> map. Every CPU maps to its own queue, and the maps do not change after
> >> fuse_uring_create(). The next commit selects queues through the maps.
> >>
> >> The possible CPUs can have gaps in their numbering. num_possible_cpus(=
)
> >> sized the queue array, so a request from a CPU at or above that count
> >> went to queue 0 with a warning. The queue array and the maps now cover
> >> every CPU number below nr_cpu_ids.
> >>
> >> Userspace might not know that a CPU is not possible, or might not care=
,
> >> and register a qid for it. The maps put such a queue on node 0.
> >
> > Where does this happen? The qid / queue can be registered but it
> > doesn't end up in the maps, no? AFAICT from this patch the map is
> > built from cpu_possible_mask before any queue gets registered. I'm not
> > seeing the logic that would place such a qid/queue in the maps. Maybe
> > just remove this paragraph? Or am I missing something in this patch?
>
> This tries to address a Sashiko report in v6, Sashiko pointed out that
> there is no guarantee that CPUs are consecutively set in the global cpu
> map.
>
> Thanks for review, I have a new branch that should address your comments
> (reduced-nr-ring-queues_v9-linux-7.4), it will go out tomorrow.
>

Thanks for your work on this, I've been a little delayed in looking at
the rest of this series, but will get my reviews for the later patches
in this week.

Thanks,
Joanne
