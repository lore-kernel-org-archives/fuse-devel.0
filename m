Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00C484231
	for <fuse-devel@lists.linux.dev>; Mon,  5 Oct 2026 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207210; cv=pass; b=TSqqJsMOaPZB5ZsCtvGcdMnkeXX6J/ySU00I6jbAQ5S4pW9sduPmHNqWnOYx+rKGJ649HMr7nHZDvFE7p/bS+Knnb/DXLeeAttjPidQG96YGQxv6mGyYDbOQ0jJpG4PfgGBcmxH/YHzAtapW41jiU6KCDbEgWm5fPir4m94a28s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207210; c=relaxed/simple;
	bh=I/7qOpbaPjFZCfk8Hbfl7OK+toY69qdxL0Ly1nx8uco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ri0mkdlyhwjJYr7kMjUXoqhwEZv0YPnDjymRwE55s2KQ+0KXWf31Oq3zC5tD2S/Hr4neOVot46Q8o8kjDuqnjkuY5HFlpI9rFeoMeBcB5HyXkvb8QXn4dy4HX1AutSptbVG3lBW1yRN3G8AZMSMh1geCTQhfQbD8A8YMGdXcbnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=N6Pm7ePu; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="N6Pm7ePu"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-530fa1d2b31so18783311cf.2
        for <fuse-devel@lists.linux.dev>; Mon, 05 Oct 2026 06:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791207207; cv=none;
        d=google.com; s=arc-20260327;
        b=eYTHCb3K7EtdDNkUaI/tewPMI9BTIbqbXvbWvWeNzZuXdLeM0G4z25PXm/0PHpKu2F
         GV8dw02LDT6UaVv11eJ+FGdQQObFa2jQbWcIPRI1qGZAHFzIkFG/zSh4pfuo4YLNqqMO
         nyxag1ZBor4G7CBnFzkqWyrlYAlKtUiH47ctRs+Muk+t9WCNDu4BVM1Nw/M0dnKexW1j
         wo08sMBGiK5T5yGXPhZ1gquZ1q9IptV5F6HKSXEL6hySFnVjjFl9TfmltNMgp1gR4Xxq
         aWG51y6L4JBWgTwo3Yj2U7eBqDCqOF/p+XZ9bouupbfjoDMrNdn2htQ6q4u20UlhsCnW
         eeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7otsqulBzc6rkKlGohX6jHgXmZfiW8WkwVHav/09IiY=;
        fh=N6Oc9rekSdSAv1HLoh4AeNV+0+qlLRyvf8hK7dyWJTo=;
        b=Hr9dEEegTzWxvQ66aQxX7F4myazo/ZDfuVI1AnguATXDu2VLopge5Slfxtme0PvTta
         wX1TCPobnTQa8BaKOPzd24kVENr31JvXuNBZNyvBGXbJ1Bf9DrdDA8T9qAfPZcPPurVe
         bGrOk52W0tp3qBOq8J4gJvwAGY11OKKjqBZtzxNupkGt5+4W+/DvrKrjuN70d+otY+H7
         U0Li7R3Hkyhty68SX8ycSaiafZidQOwcbTO5dEukltqAScNW6xUDzy91doYgolH/nipU
         cXH9mud98eJV9wW3xFD582bqBg+NSR7IgHCkXqPHE33zVN4+jfpHordhKj4znVtTlE1E
         7p6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791207207; x=1791812007; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7otsqulBzc6rkKlGohX6jHgXmZfiW8WkwVHav/09IiY=;
        b=N6Pm7ePu/EL8WkBbZL/7V3x2BZ0Us2Si3cYGKJhvQubynK3n+E0SrGK8pjoLS7opuv
         HNETtsNcGUhDFTx84xhvTLLaqfhpG0LRedwc0v5cSFmvYoi+Uf1DASH6AMjp/bAOc65P
         xIFqUz/E7iBhmAeRsuAOXIrSZ2siJOuzy+Rto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791207207; x=1791812007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7otsqulBzc6rkKlGohX6jHgXmZfiW8WkwVHav/09IiY=;
        b=tLrjgVhBPJUZ33om5PImroKbxcWV1DcnKg7jpZq9ukmsC9bKyDdGUCJkLXNMeJJVzS
         8M/Ow+T4qW1LQ3FIzwcQ74CH2XZ7t4Tyos2naxwCP2+KF1wjBNQJnKoUbU5tHfsnl2F5
         Tr7diNJQEFowYOs9Ao3mP+CeLhKOIAVEYf/ilpPt9Oe/8gGmxTSFFDR4v0iwbbBT7qbk
         5J3/VThRycDS2+65Pu+a0AVSNJxyVuC/+QgsLlhjIkRuzN1lnyh2qqW6CdxTvgfIhXPR
         QVsk7xB6lhcdhj+MUjNcwgZQT/fecINSDIfiKSqnylqnHyjbDwW9VhOP6rq0st6pIMsn
         F00A==
X-Forwarded-Encrypted: i=1; AKwUvBzNnUl2c69V0giSu20iFlpckGlycAu3qlnW2sk7PZGSyc6L14wCvf7xD1o/9sqM1hipJ4g9si9ohXX5@lists.linux.dev
X-Gm-Message-State: AFuF++m/z1X57vqE2f2JAx1DXKHPH3fPO+aMWfQhE1eD3ymTBaD9/e+z
	Si4wG+XDJ4iezguX+2OVHUMUM+VqD3vpYd/yU+wUmCgh+GQEH6HWa9F8lOX4v99lX+vQbbqfvde
	MVo/KgRNAwCC9t2IbIrZCk15qbe0/FrCDDvDiBkNIFQ==
X-Gm-Gg: AYBFou06DCo/q1AQTFO1ulH32SPRHem0R6RqaPzxZwgUbmExf4VaNO4+DTf9DX1BIrl
	Gbe3jNI9pFlDYkKAG1nAMHd0Y9ZEE822nYdf1oFYdA+1LnfG1t3fC3DXjfYWMPbgCaOjCK/9OL5
	7YWt/p1NC/l07vw74CbX7LrlorxG7rJYEDnsNYrdZOX0UnqQU7dOGamcYt3OFM6Ne65OSjtgUp0
	PmjqJUYCmo6MllFyjp6CiTMqEgIOH17gLPoRhsRlvLIpDhIREwSVoDe3bwcKqnQPxwyo4GfwA0p
	jFyz39MjZG/xYM89pii3Zc/KAT2TLNjtBr1Y1jC/msDahGgrNlv3VFUInh8ozTU/hqpqu4m/UW7
	8nQb8nJbH9lY9GRhNrEYDtqQ=
X-Received: by 2002:a05:622a:1ba6:b0:533:9826:a9ac with SMTP id
 d75a77b69052e-53511e43589mr124329411cf.20.1791207207172; Mon, 05 Oct 2026
 06:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001150935.655979-1-mszeredi@redhat.com> <20261001150935.655979-4-mszeredi@redhat.com>
 <CAOQ4uxjWCRs59Qpc4t+2=i67rdJkHt=+rH07ZXv7ZzAvTjTm-A@mail.gmail.com> <CAOQ4uxi1+WgHJdnRKMD3tp24EOyx7iPByzSKLn_siTVY3_sRDQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxi1+WgHJdnRKMD3tp24EOyx7iPByzSKLn_siTVY3_sRDQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 5 Oct 2026 15:33:15 +0200
X-Gm-Features: AclHuK98SWoqABe7rwTyIrlCpXfPZvMeW8Yn8TO-gyQNFntxAo01LmvUy6dhY_s
Message-ID: <CAJfpegttAHQAGhE61t-VZqfQv9Z==ovbyLY6qp3KOK_CvjBciA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] fuse: support 64 bit, server allocated backing ID
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 20:59, Amir Goldstein <amir73il@gmail.com> wrote:

> > > All 64 bit values are valid.
> >
> > Can you reserve id 0? or have a reason to need it?

I thought that removing all restrictions on the value would be nice.
But okay, zero value we can live without.

> > It would feel a little less hacky if we do:
> >     else
> >           fuse_backing_files_init_32(fc);
> >
> > and set
> >          fc->passthrough = 1;
> >
> > inside both of them to gate against fuse_backing_files_free()
> > called without processing init response,
> > or without either FUSE_PASSTHROUGH in the init response.

Bigger problem is that IOC_BACKING_OPEN can be done before or during
INIT.  So we need to take care of that case and the race as well.
Fixed by:

 - leaving the idr initialization fuse_conn_init()

 - adding fc->backing_id_32 flag which is set by fuse_backing_open()
after chekcking that fc->backing_id_64 is not set.  All under fc->lock

 - in process_init_reply() checking fc->backing_id_32 before setting
fc->backing_id_64 and failing the connection if so.  Also under
fc->lock

 - in fuse_dev_ioctl_backing_create() if fch->initialized is not set
return ENOTCONN

> Also we should not enable passthrough if rhashtable_init has failed.

rhashtable_init() can't fail if parameters are correct since it falls
back to __GFP_NOFAIL() for allocation.

Thanks,
Miklos
