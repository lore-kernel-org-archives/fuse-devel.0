Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34936497B97
	for <fuse-devel@lists.linux.dev>; Wed,  7 Oct 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377385; cv=pass; b=B10JDoQvntWlFfyOWTBbaDAHffrxQy5cnGdWxPUgKKBY+H5QV12A3S17Sm8tEGOM1rvVAP8rjRIYWrW/ry6hG2DKYPSBf0xsJH2itzA4/DjBjzcfpbbDz/na+HR6H3fQpw0ewFJiUIdrdJaYb/DsUkIg5dxch86aXcR7rJaIz00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377385; c=relaxed/simple;
	bh=mAgXxfJyyCw2IfTJGYnt6Q3vjMyFJUM/9cY0xhm0WzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkOohUVPcKfOMHbsZt9Mp/oqtNlB9O5wtYg4qEuSq8T7VijINyVXMjvOYqUCvZ1oLUtFJkICqE0PrMf6wIm9K9Kj+x6MrX1hdUaI7XzcwcJGE76Vd5yoM9+efu/XZb6iUGhxbUBMHGMfp0bvbzB5/9Ttoglel6N1jNRTpwKR0Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=PgLYza8g; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="PgLYza8g"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53582498790so3039021cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 07 Oct 2026 05:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791377377; cv=none;
        d=google.com; s=arc-20260327;
        b=g+Gv+JuDQNe1EByx2IW6QzP59tD0hsoJX2aHQswelWpNMC/9m2npAvqmIRtrrCPmFq
         ZhBJeRF6wVrhS3XJQWXYKkTvmZS12SLLFAY686/53K0ZIjNJN5gLrDknFgpE6XwaRDpW
         uQXE0OblGNXKpO9SuS2Cl+lpzyOTTwMd2o2R+1U33makvLHU5FIj5pw+LiANWlutjAP/
         WjsNAnuS79D1WJVbncJHXBI1dNPbr+YzyYPBWpeXURjWQV5dwu1nfh87UTiKAtuxRZdi
         /5WTuVlQqymnyT1LjQoQxt56sagx0+iNOsS41B9nnDcYVWWCiUDoSPPCvNs5IabGj3Kr
         IaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uxDzaT2//lTPxw9qRyuCA3FIYAYiZrpJTXv/2HtipC4=;
        fh=sLWRE27Rtlurp7PStFt+ZqN3G/OQLmvhHv/OK5PIa34=;
        b=ZUTEkKaAOiOZrHvFtgF6G+pT5Zoc1LdDYFs3keXU3RZrNSc3bo3N0MIqX9f38yZw7c
         n+LfLB2MQOXM0g3kc8kMDqiWwfUaAHouZp5uLKTCXDT3Xu6Ela9zU/OA9ypE1RhGviYm
         yNyRDaEZCYnBIOaiq+aPH62sjGCWSlUqdu6qvOQrEIgfUXzvDhWkekON27xiOOqGWV/v
         kKRF6O5Y7fDwtFJRER8LqZ3rhRGOHAKAKE7bkFQf9gr/N5OtbzhiTLqia2z/DFazo4Pv
         HvdR7U6rSVRrKSOGmJG66bKGPE66W10QXHuNVrjqIDc903XsoAYergyG69UmMIC2y3zm
         V1DQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791377377; x=1791982177; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxDzaT2//lTPxw9qRyuCA3FIYAYiZrpJTXv/2HtipC4=;
        b=PgLYza8gL3Jn1NhMGzbqABbWxien/K66It3Qh+F+lZ/sI2ycHu6HMa+PMLUB/I+xO6
         U087o7HkX/P9I4C1tsCmtkV0+/kxra1/xO5Vchu+5ksiDmrsr0/DasX0N3aOilo1sgxC
         HM2DKu41VBV3JWPt7KlOosZUXF/GBpR2UEvYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377377; x=1791982177;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uxDzaT2//lTPxw9qRyuCA3FIYAYiZrpJTXv/2HtipC4=;
        b=Jm7BHtS9CVISmu4qtqyEP6L+6HcOGHQNrdumqmibDAJrjgwbJGp5E781IpBA0+b5oc
         /zIIWq/X7yMIy7gIJsvK/rh/35anxMFmAAIGh6Gb89jCEKZ54RaEivFfn0New3RiJtnv
         y96oh4KA7I0EXz0qmxBDdCKdTBuHaJb5jH2BBg/ba+UgGG7krwBcuAw7LQYX9RKtBzbn
         +aiGLkz3BIBpSKLCgMM74lSBQd6g8BRRPiMwz8O/ilWzSLp7KWuXQ9dToWHq/rE6P7OX
         c//220YPISxiqO0rWKX+CCnLmoy3rXmOVQZO+BKz/AojGLHXtAE8e+y41KACrTZsszwF
         DodQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdumCrj0C1skX4UPhsYiCmNgpfFc71K4JOK2XOoVQ4k6Sj4H69/wPbtEjs9gKRiDQiuk23uGn0ihyl@lists.linux.dev
X-Gm-Message-State: AFuF++kjLqVJRajj9Y+2NbfvSjW08QhppqBn9DU6Eq/cZeiJFPc9+GJl
	V3mwtfwA0GVAe72zFPsUeSPD7zhm8bTWbfJL27GXejNOzbSzM3eHdnAPj41p7zj+vW1yjuJ9BG8
	99kJkhYlXg32jyk8e6tsk3iWavw+FPMHK8JTARIEKpQ==
X-Gm-Gg: AYBFou0eIm5FwIDXoW/ok18Yhfl85b/LaYSLBoDIQlQm72MlsHkT6U814Ls2mvuYjOf
	VMQx5SMveZmTrJWoOikLBrs8smS/udGNZ1siodgXoXIlh7c+RvxCpldYQEG/NCpIm1o5tOTiC7B
	oH2aDA36VZAxSuUuGOyPhTtICY9mPH/xQxsn1d0laH9JjkTPXl6sCLSBSq9EVoYS12jvp+XjFzU
	JDHpOj0+tZZc9Z2bAlblPvf0yN+WGvPFEOlR/LmPgg4YiGmuNG3uMpASqXilQ3uY3Ty4xjrprEh
	I1jX6OQ3VeRIfQ4PsDIBVU4Rtg3B6BIL0mMgVgLREBmOmNgYnEZJCNqlHkyzrJEsabku8IWn/xA
	AJaCgZxi9q2sa
X-Received: by 2002:a05:622a:3d1:b0:532:c947:6e49 with SMTP id
 d75a77b69052e-5357556ee8dmr37063011cf.59.1791377377065; Wed, 07 Oct 2026
 05:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006180115.1425232-1-mszeredi@redhat.com> <20261006180115.1425232-5-mszeredi@redhat.com>
 <6501a22c-f484-43d4-b109-5d8021cc3dc4@app.fastmail.com>
In-Reply-To: <6501a22c-f484-43d4-b109-5d8021cc3dc4@app.fastmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 7 Oct 2026 14:49:25 +0200
X-Gm-Features: AclHuK_YHztya3DDjK3LgyU2Etjp1vNeeb0RFji1-VAcGP52Hh_NQ1Uorppslkg
Message-ID: <CAJfpegsvnzcq==FHM1DRmr6LaA2daC4_NT05Qy-174O7oc2jxQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] fuse: support 64 bit, server allocated backing ID
To: John Groves <john@groves.net>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	Amir Goldstein <amir73il@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 22:12, John Groves <john@groves.net> wrote:

> This doesn't build with CONFIG_FUSE=m. Maybe do something like this?

I'll just add EXPORT_SYMBOL(fdget_raw).   There's no reason to not
export this if fget_raw() is exported.

Thanks,
Miklos
