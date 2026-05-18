Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388A371053
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137821; cv=pass; b=lxdRysrxzAKZ8JdhPweafPXseojm8gSPCbOVQSj60OAKNj1hEfFFtMdklFgYb/u9DsH1vSKVc+6RD5KpL56lGBsLUy94pN9mU2uiLR3rJoptNusWVXVvASDTc1onhL9E7YogWKcp1nHg56cNU+lSOink/r1tamYEm9N+15old2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137821; c=relaxed/simple;
	bh=O7yNteNB8Vvmz+auSl9LhOd2cAR6aF1IyCYgjo1KoT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=roibn/AN6fBHMVmt2RW3IsBkjy/+qm20s0MCPq54NeT9+slDwKrJEK2W7qx1XdfqHqkMa5xBx0PZqVR+ziQuYepZ8te04XxdsXPJnPhh6gKAQ2xgsY1ZC9b/LDxrQbvzKEGBbwK7A0/K8FA0pxgT9MT5W7SVTjGRa/RmQ9gplU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asoe1x52; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asoe1x52"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso28662245e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 13:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779137818; cv=none;
        d=google.com; s=arc-20240605;
        b=ejMeIpUpF+XFxoFw1C+7Mi0OT48R091fxK9dS/HqPVFIyAEK+hg/OxmcTeJStdFrZ8
         LYjT7mIN2VeowoYmsLvNh0ppFuWNj5IVoGGKTTgkMvWC9H60Wx+7OTX1CCESRrloGU6c
         ft3b5gk7yDhOiyvIbEbQ0z5hptxpimxORvCRSklwVEN+09iscN9JennYl9S8xH9Areki
         +fuMcnua3/4WL8f0Qa2XSLdLCM6GzYS3RsK7184CSsjDVUdatmWAg/VPI+B8fHH09qNe
         WOGrS03Tj5WFT+UC+H2E7NFCIg1ALtjuWYZ3eOVmgNeVZu6YAB+8NpQf7au/+xTa/rZs
         P9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vlQVAcswqTiXHTsw5kgApTgT9RUz0A4MUuUWzK6vBMY=;
        fh=8CBNU34taq1O56JRdVgurzu5J8LmdwHGrW0UGtOI7ps=;
        b=GM15X71LXGgvWhRo/zJ0/6YoEv+e3u2WGmkAHiOzIWi55YSYtdXnIvXIY8usyQy/st
         qkZHugCjvO1AUxqg0FWjMGtkpcdrYERFdgM1TZ+jkHbAffaLuhnjjx8aWk04J+hnVHWe
         Y2lnF8mk/YK4r4RapxPl1hvKT1HVhL55YgcsVYbmrl6Y3dZRLunmZ9GkJa+HxPcwCtAr
         7MvVZiQF0tcFOuBVOhpwrwTqSNvKQrzgm1Xx0YEq1kBA3Q/wa+Urlgs0F4rz6ZkKn0dy
         NAZdUBOI7DAfLjE/gbWTEQzX+YLARDo3EHyYN/JrWId3uHJC0pSNskspLITcRLwkGa+9
         AkuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779137818; x=1779742618; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlQVAcswqTiXHTsw5kgApTgT9RUz0A4MUuUWzK6vBMY=;
        b=asoe1x522SbWKH9d3eoMKc3/NraIa8GZKmTKCI6dO/j4JHSO9xqdURu37nmcMsYgot
         2tChrtZbJk/o7cSkK8uX6YFbQzsGqgOX4SWZbDhw+r5IvR80DJdnCBVihB9FTlV34J6m
         HJtcgFjmoEiNBBrgiu+gMFEBl6INLzIi+WAH6RjDFHTAZk8eHz43VFJLo1ZfqFzzF3Zk
         7P+4WMSjXulrnjeFwxfdnW/9yMw/Vz5pl+Arhlx176qikfElQdyOfFJ6GYn7Ry8xpowf
         S//ma9ZDatllBmR7XKe8I+OkQWQkOcHivlMOLcSUI3XtzuUYu3fLEOZ/VTrc3QfhPuZx
         0S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779137818; x=1779742618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vlQVAcswqTiXHTsw5kgApTgT9RUz0A4MUuUWzK6vBMY=;
        b=HoVoTXXmShuj/TBj1r5uY45B8lgsIKpGuucbr5p54alxQWxEuCj5t27KhuAiCvRdmo
         A1hRg61/r3Y34/54GYuh4onuR1bHEP4dPLf0mApKxdOB1SuWLh+diwgPsb/taaWqjsWA
         eg94Cm+gVfy3olFNpoPhhFfjbaUtV6hBNvjCMNKUZaqqquHihy7FdVCiGYSMdRmpDJmy
         xJYuWc4E90NHYlFK/Tfw6hsp+32UUjjyAcjzIGE0di+gAkWp5h4MaqK4PqbJRmnVOgbm
         3qkmYZQrSinXDYA9pcXuTcg2jSbH4WAguzSjOrS9sg08KYUdQ7PpUV4qnKkFlBW9HMj6
         FiMA==
X-Forwarded-Encrypted: i=1; AFNElJ/gwYLDaVMHWkISpOg6mEAL9GboRJfee9TwGxn/uFWJyKYi5cpS7Brwg1esybUE3dSPeF+I5mH4yVn4@lists.linux.dev
X-Gm-Message-State: AOJu0YwDZfQGveormj7prgqXzNnb8UXCYBC38VEoKKO2wQSpkeN12lFE
	ac+jBD4MTtPfMWlbDd6uj32FStS7TpscHtQ1KL2rAnfeNxOO/fNNOCbG36RyL3tK/Op8jJmauYZ
	GBF7thaba7vABWnfPQL8Blb5sC1kghsA=
X-Gm-Gg: Acq92OFZz0Hs5XBMSb6Oj5EKpcC6VYKBnGMAnSSPLgA8Zql6QrkoZUWNc1VG9vCOfjD
	4t5GjqaZieo1Z/CLJLDoAYU9c3HAHowKCzq3q7um3oWCk4rk2/heM8+95gN1xNWge/Kk4almELZ
	OA47KfSRMrr5KveVeH195xsFD0DZblWgMKSIip1STm2CIDG+xWcHj3Cw/SnGxSKvzNcGiY6NGv1
	9B093IH8uYjSRUBBdR174P8K9F6ywokLXeBPGKtm1e8SePlZQarhDJLn0Lxd1LjT3BrR8NTaEIj
	Y/W5xA==
X-Received: by 2002:a05:600c:858d:b0:48e:5990:96b1 with SMTP id
 5b1f17b1804b1-48fe6514c62mr204044195e9.23.1779137817779; Mon, 18 May 2026
 13:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-3-joannelkoong@gmail.com> <CAJnrk1YUjqd+j1yLXuO0M07ueCUYNC0NqgwmQSm3OiY3hnhgZQ@mail.gmail.com>
 <CAOQ4uxhyZU_6jbv8kY8od_SgG9yQ6aX+KcB2c1um4DajJdSPqA@mail.gmail.com>
 <CAJnrk1aEc1nf7ax0UvdCi7rkzbWDFpgjJcE35HCQyWcPLdoOnw@mail.gmail.com> <CAOQ4uxhUZByYu6hp0TSekZ49FZDp20xPTpG9CmFDjtiTfh8Sgg@mail.gmail.com>
In-Reply-To: <CAOQ4uxhUZByYu6hp0TSekZ49FZDp20xPTpG9CmFDjtiTfh8Sgg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 13:56:43 -0700
X-Gm-Features: AVHnY4Kk7UjvKo5G96rFFAWOoPehDm6nCtStEnSj10UV4YnAhPnsD8T12ZhmYgI
Message-ID: <CAJnrk1ZO5s=71tMEJZ5Lt3cfjPijPt2bzucbYT70qJE-GuWz7w@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] fuse: prepare for passthrough of inode operations
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 11:39=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Mon, May 18, 2026 at 8:04=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Sat, May 16, 2026 at 9:11=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Sat, May 16, 2026 at 3:34=E2=80=AFAM Joanne Koong <joannelkoong@gm=
ail.com> wrote:
> > > >
> > > > On Fri, May 15, 2026 at 5:52=E2=80=AFPM Joanne Koong <joannelkoong@=
gmail.com> wrote:
> > > > >
> > > > > +/* op bits for fuse_backing_map ops_mask */
> > > > > +#define FUSE_PASSTHROUGH_OP_READ       FUSE_PASSTHROUGH_OP(FUSE_=
READ)
> > > > > +#define FUSE_PASSTHROUGH_OP_WRITE      FUSE_PASSTHROUGH_OP(FUSE_=
WRITE)
> > > >
> > > > Do you think we should couple the passthrough op code to the fuse
> > > > opcode so closely, instead of defining the passthrough ops separate=
ly,
> > > > eg doing something like this?:
> > > >
> > > > #define FUSE_PASSTHROUGH_READ         (1 << 0)
> > > > #define FUSE_PASSTHROUGH_WRITE       (1 << 1)
> > >
> > > Don't drop the _OP_ please
> > > Need it to distinguish from FUSE_PASSTHROUGH{,_INO}
> > > and we need to think if we want to format this as 32bit and extend la=
ter
> > > or start with a u64 ops_mask format from the start.
> > >
> > > >
> > > > In the (far) future when some more advanced passthrough features ge=
t
> > > > added (eg full subtree passthrough), it seems like we'd want to add=
 a
> > > > passthrough op for that,
> > >
> > > I don't know. fuse_backing_map has flags, why would we want to put th=
at
> > > in ops_mask.
> >
> > That's a good point, I like your idea of using flags for that.
> >
> > >
> > > > but that wouldn't map to a fuse op. I think
> > > > there are also some fuse ops we might skip defining as passthrough =
ops
> > > > but are implicitly passed through (eg FUSE_STATX which is covered b=
y
> > > > FUSE_GETATTR),
> > >
> > > This could also become the case with FUSE_CREATE{,_HANDLE}
> > > or {FUSE,FUSEX}_CREAT.
> > >
> > > TBH, the fact that some ops will never be in the mask and
> > > that some ops have a canonical bit in itself does not justify creatin=
g
> > > a different mapping. Do we also want to squeeze the mask into 32bit
> > > and leave reserved space? my intuition is to leave it u64.
> > >
> > > > so it seems more intuitive to define the passthrough
> > > > ops as describing capabilities rather than implying that it describ=
es
> > > > what specific opcodes get passed through?
> > >
> > > hmm. I guess you have a point that it is a bit limiting to commit
> > > to this arithmetic in UAPI.
> > >
> > > My thinking behind this was ease of use with these helpers:
> > >
> > >        if (!fuse_passthrough_op(file_inode(in), FUSE_READ))
> > >
> > > but those could just as well be macros:
> > >
> > > static inline bool fuse_inode_passthrough_op(struct inode *inode,
> > >                                             u64 opbit)...
> > >
> > > #define FUSE_PASSTHROUGH_OP(inode, opname)    \
> > >              fuse_passthrough_op(inode, FUSE_PASSTHROUGH_OP_ ## opnam=
e)
> > >
> > > #define FUSE_BACKING_MAP_OP(map, opname) \
> > >        ((map)->ops_mask & FUSE_PASSTHROUGH_OP ## opname))
> > >
> > > ...
> > >        if (!FUSE_PASSTHROUGH_OP(file_inode(in), READ))
> > >
> > > wdyt?
> >
> > Nice, the macro idea is neat!
> >
> > I feel like it gives more flexibility to define it separately and I
> > think with that, u32 would be more than enough bits as well. But I'm
> > happy to go with what you think would be better here.
>
> I am not sure. Let's keep it u64 for now.
> Since the struct is in an ioctl, it does not really matter much.
> If we ever consider moving backing_map responses inline
> in lookup/readdirplus response (maybe over io uring) we could reconsider.

Sounds good. For v3 I'll keep it a u64 but define them separately and
use your macro helper for mapping from opcode to passthrough op.

>
> In case you missed the exciting conversations about this API
> original fuse passthough patches from Android had the backing fd
> in the open response but it was deemed unsafe writing fds to
> /dev/fuse, so ioctl was chosen instead [1].

Wow, that's a clever attack. Thanks for sharing the link.

Thanks,
Joanne
>
> With io_uring I don't think the security concern holds, so I see no reaso=
n
> why backing_map would not be possible in-place for readdirplus
> responses if we wanted to do that, but we can also ignore all this for no=
w.
>
> Thanks,
> Amir.
>
> [1] https://lore.kernel.org/linux-fsdevel/CAG48ez3ZX8R9kRAQhung2_e3wjowu5=
cPh7WL3U866mkga-kftQ@mail.gmail.com/
